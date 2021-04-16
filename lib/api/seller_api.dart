import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class SellerApi {
  Dio dio = new Dio();
  Future<File> uploadImage({File file,int neww}) async {
    String fileName = file.path.split('/').last;
    print(fileName);

    FormData data = FormData.fromMap({
      "source": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: new MediaType("image", "jpeg"),
      ),
      "file_type": "image",
    });

    final response = await dio.post(
        "https://master-white-box-cartoonization-psi1104.endpoint.ainize.ai/predict",
        data: data,
        options: Options(responseType: ResponseType.bytes)
    );
    // print(response.data);
    if(response.statusCode == 200){
      // var resopo = jsonDecode(response.data);
      // print(resopo["0"]);
      var documentDirectory = await getApplicationDocumentsDirectory();
      var parent = documentDirectory.path + "/images";
      var filePathAndName = "$parent/avatar$neww.jpg"; // Build your image path here
      await Directory(parent).create(recursive: true); // Make sure directories exist
      File file2 = new File(filePathAndName);
      file2.writeAsBytesSync(response.data);

      return file2;
    }else{
      return null;
    }

    // File image = write;
    // return image;
  }
}

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mfp/api/seller_api.dart';
import 'package:mfp/mainpage/login.dart';
import 'package:mfp/model.dart';
import 'package:mfp/notess/notessMain.dart';

final List<Anime> imgList = [
  Anime(
      url:
          "https://i.ibb.co/FYsrNVb/Whats-App-Image-2021-04-11-at-11-10-44-PM.jpg",
      quote: "Cartoon"),
  Anime(url: "https://i.ibb.co/CKSpFzX/img1.jpg", quote: "Anime"),
  Anime(url: 'https://i.ibb.co/Ps2LWNq/img2.jpg', quote: "Disney"),
  Anime(
      url:
          "https://filmdaily.co/wp-content/uploads/2020/12/thecroods2-lede.jpg",
      quote: "Croods")
];

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  CarouselController buttonCarouselController = CarouselController();
  File _image;
  final picker = ImagePicker();
  int num = 0;
  int page = 0;
  int pageno = 2;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImage() async {
    num++;
    File image = await SellerApi().uploadImage(file: _image, neww: num);

    _image = image;
    setState(() {});
    // print(reply.success);
    // if (reply.success == 1) {
    //   Navigator.pop(context);
    // } else {
    //   return null;
    // }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[100],
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(22.0)),
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.lightBlue),
                        icon: Icon(Icons.search, color: Colors.lightBlue),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.mic, color: Colors.lightBlueAccent),
                        onPressed: () {}),
                    VerticalDivider(color: Colors.greenAccent),
                    IconButton(
                      icon:
                          Icon(Icons.more_vert, color: Colors.lightBlueAccent),
                      onPressed: () {},
                    ),
                  ]),
                ),
              ]),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 2.0,
                    onPageChanged: (tim, dsd) {
                      page = tim;
                      if (page != 0) {
                        pageno = 3;
                      } else {
                        pageno = 2;
                      }
                      setState(() {});
                    },
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
                page == 0
                    ? Column(
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.width / 1.8,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              border: _image == null
                                  ? Border.all(color: Colors.white)
                                  : Border.all(color: Colors.greenAccent),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: _image == null
                                  ? Image.asset(
                                      "assets/images/imgg.jpg",
                                    )
                                  : Image.file(
                                      _image,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          _image == null
                              ? Container()
                              : GestureDetector(
                                  onTap: () {
                                    print(_image.path);
                                    _image = null;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.lightBlueAccent[200],
                                          Colors.greenAccent
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.clear,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Remove",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: _image == null ? getImage : uploadImage,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent[200],
                                    Colors.greenAccent
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    _image == null
                                        ? Icons.photo
                                        : Icons.upload_outlined,
                                    color: Color(0xfff5f5f5),
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _image == null
                                            ? "Select your Image from your gallery"
                                            : "Tap to Upload",
                                        style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        _image == null
                                            ? "JPEG, JPG & PNG"
                                            : "Be Sure",
                                        style: TextStyle(
                                          color: Color(0xfff5f5f5),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            width: MediaQuery.of(context).size.width / 1.2,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent[200],
                                    Colors.greenAccent
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 1)
                                ]),
                            child: Text(
                              "Offer Limited! Buy Now Anime Version, Disney Version, Croods Version for Lifetime by making a pay of only Rs.250 asap!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent[200],
                                    Colors.greenAccent
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.greenAccent.withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 1)
                                ]),
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: pageno,
        color: Colors.lightBlueAccent[100],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.greenAccent,
        height: 50,
        items: <Widget>[
          Icon(
            Icons.rate_review,
            size: 30,
            color: Colors.blue[600],
          ),
          Icon(Icons.favorite, size: 30, color: Colors.blue[600]),
          Icon(Icons.add, size: 40, color: Colors.blue[600]),
          Icon(Icons.payment, size: 30, color: Colors.blue[600]),
          Icon(Icons.person, size: 30, color: Colors.blue[600]),
        ],
        onTap: (index) {
          debugPrint("Current is $index");
          setState(
            () {
              if (index == 0) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                      child: Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Rate Our App Now !'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 320.0,
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: const Color(0xFF1BC0C5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              else if(index == 1){
                Navigator.push(context, MaterialPageRoute(builder: (_) => HeartList()));
              }
              else if(index == 4){
                Navigator.push(context, MaterialPageRoute(builder: (_) => AuthScreen()));
              }
            },
          );
        },
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item.url, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        item.quote,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
      .toList();
}
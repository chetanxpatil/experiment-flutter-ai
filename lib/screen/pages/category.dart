// import 'package:flutter/material.dart';
//
// import '../home/navigation_bloc.dart';
// final CategoriesScroller categoriesScroller = CategoriesScroller();
//
// class CategoriesScroller extends StatelessWidget with NavigationStates {
//   const CategoriesScroller();
//   @override
//   Widget build(BuildContext context) {
//     final double categoryHeight = 150;
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Scaffold(
//         body: Container(
//           margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//           child: FittedBox(
//             fit: BoxFit.fill,
//             alignment: Alignment.topCenter,
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   width: 150,
//                   margin: EdgeInsets.only(right: 20),
//                   height: categoryHeight,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         new BoxShadow(
//                           color: Colors.black54,
//                           blurRadius: 20.0,
//                         ),
//                       ],
//                       color: Colors.orange.shade400,
//                       borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                   child: Stack(
//                     children: [
//                       ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Image.network(
//                             "https://source.unsplash.com/user/erondu/1600x1600",
//                             fit: BoxFit.cover,
//                           )),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 15,
//                           vertical: 10,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Anime",
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "20 Items",
//                               style: TextStyle(fontSize: 16, color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(),
//                 Container(
//                   width: 150,
//                   margin: EdgeInsets.only(right: 20),
//                   height: categoryHeight,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         new BoxShadow(
//                           color: Colors.black54,
//                           blurRadius: 20.0,
//                         ),
//                       ],
//                       color: Colors.blue.shade400,
//                       borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                   child: Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Center(
//                             child: Image.asset(
//                               "assets/images/AAA.png",
//                               fit: BoxFit.cover,
//                             )),
//                       ),
//                       Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 "Anime\nVersion",
//                                 style: TextStyle(
//                                     fontSize: 25,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 "20 Items",
//                                 style:
//                                 TextStyle(fontSize: 16, color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 150,
//                   margin: EdgeInsets.only(right: 20),
//                   height: categoryHeight,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         new BoxShadow(
//                           color: Colors.black54,
//                           blurRadius: 20.0,
//                         ),
//                       ],
//                       color: Colors.lightBlueAccent.shade400,
//                       borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           "Super\nSaving",
//                           style: TextStyle(
//                               fontSize: 25,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "20 Items",
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//         ),
//
//       ),
//     );
//   }
// }

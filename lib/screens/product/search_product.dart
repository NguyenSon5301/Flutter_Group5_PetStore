// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'alltitle_product.dart';
// import 'detail_page.dart';

// class SearchProducts extends StatefulWidget {
//   const SearchProducts({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<SearchProducts> createState() => _SearchProductsState();
// }

// class _SearchProductsState extends State<SearchProducts> {
//   final ScrollController scrollController = ScrollController();
//   void onListen() {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     scrollController.addListener(onListen);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     scrollController.removeListener(onListen);
//     super.dispose();
//   }

//   String noidung = '';
//   final searchController = new TextEditingController();

//   final itemSize = 150;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 1000,
//         child: Expanded(
//             child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(width: 1)),
//                 width: MediaQuery.of(context).size.width,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         height: 50,
//                         width: 300,
//                         child: TextField(
//                           controller: searchController,
//                           decoration: const InputDecoration(
//                               hintStyle:
//                                   TextStyle(fontWeight: FontWeight.normal),
//                               border: InputBorder.none,
//                               hintText: "Search Products"),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             noidung = searchController.text.toString();
//                           });
//                         },
//                         icon: const Icon(Icons.search),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )));
//   }

// // StreamBuilder(
// //       stream: FirebaseFirestore.instance
// //           .collection('products')
// //           .where('Title', isEqualTo: noidung)
// //           .snapshots(),
// //       builder: (BuildContext context, AsyncSnapshot snapshot) {
// //         if (snapshot.hasData) {
// //           return  SizedBox(
// //                     child: GridView.builder(
// //                       shrinkWrap: true,
// //                       controller: scrollController,
// //                       scrollDirection: Axis.vertical,
// //                       itemCount: snapshot.data.docs.length,
// //                       itemBuilder: (BuildContext context, int index) {
// //                         return AllTile(
// //                             image: snapshot.data.docs[index]['Image'],
// //                             title: snapshot.data.docs[index]['Title'],
// //                             price: snapshot.data.docs[index]['Price'],
// //                             callback: () {
// //                               Get.to(
// //                                   DetailPage(
// //                                       title: snapshot.data.docs[index]['Title'],
// //                                       image: snapshot.data.docs[index]['Image'],
// //                                       dec: snapshot.data.docs[index]['Dec'],
// //                                       price: snapshot.data.docs[index]['Price'],
// //                                       category: snapshot.data.docs[index]
// //                                           ['Category']),
// //                                   transition: Transition.fade,
// //                                   duration: const Duration(seconds: 1));
// //                             });
// //                       },
// //                       gridDelegate:
// //                           const SliverGridDelegateWithFixedCrossAxisCount(
// //                         crossAxisCount: 2,
// //                         crossAxisSpacing: 4.0,
// //                         mainAxisSpacing: 24,
// //                         mainAxisExtent: 285,
// //                       ),
// //                     ),
// //                   )

// //         } else {
// //           return const Center(
// //               child: Text(
// //             "Loading....",
// //             style: TextStyle(color: Colors.white),
// //           ));
// //         })
// }

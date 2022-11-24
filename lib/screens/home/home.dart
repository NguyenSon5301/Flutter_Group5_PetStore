// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:test_app/screens/home/widgets/products.dart';
// // import '../../widgets/custom_text.dart';
// // import '../services/auth.dart';
// // import '../../models/loginuser.dart';

// // // class Home extends StatefulWidget {
// // //   const Home({Key? key}) : super(key: key);

// // //   @override
// // //   State<StatefulWidget> createState() {
// // //     return _Home();
// // //   }
// // // }

// // // class _Home extends State<Home> {
// // //   final AuthService _auth = new AuthService();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final signOut = Material(
// // //       elevation: 5.0,
// // //       borderRadius: BorderRadius.circular(30.0),
// // //       color: Theme.of(context).primaryColor,
// // //       child: MaterialButton(
// // //         minWidth: MediaQuery.of(context).size.width,
// // //         padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
// // //         onPressed: () async {
// // //           await _auth.signOut();
// // //         },
// // //         child: Text(
// // //           "Log out",
// // //           style: TextStyle(color: Theme.of(context).primaryColorLight),
// // //           textAlign: TextAlign.center,
// // //         ),
// // //       ),
// // //     );

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Login Demo App - HomePage'),
// // //         backgroundColor: Theme.of(context).primaryColor,
// // //       ),
// // //       body: Center(child: signOut),
// // //     );
// // //   }
// // // }

// // class HomeScreen extends StatelessWidget {
// //   HomeScreen({Key? key}) : super(key: key);
// //   final LoginUser loginUser = new LoginUser();
// //   final AuthService _auth = new AuthService();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.white,
// //           iconTheme: const IconThemeData(color: Colors.black),
// //           title: const CustomText(
// //             text: "Sneex",
// //             size: 24,
// //             weight: FontWeight.bold,
// //             color: Colors.grey,
// //           ),
// //           actions: [
// //             IconButton(
// //                 icon: const Icon(Icons.shopping_cart),
// //                 onPressed: () {
// //                   // showBarModalBottomSheet(
// //                   //   context: context,
// //                   //   builder: (context) => Container(
// //                   //     color: Colors.white,
// //                   //     child: ShoppingCartWidget(),
// //                   //   ),
// //                   // );
// //                 })
// //           ],
// //           elevation: 0,
// //           centerTitle: true,
// //         ),
// //         backgroundColor: Colors.white,
// //         drawer: Obx(() => Drawer(
// //               child: ListView(
// //                 children: [
// //                   Obx(() => UserAccountsDrawerHeader(
// //                       decoration: const BoxDecoration(color: Colors.black),
// //                       accountName: Text(loginUser.email ?? ""),
// //                       accountEmail: Text(loginUser.email ?? ""))),
// //                   ListTile(
// //                     leading: const Icon(Icons.book),
// //                     title: const CustomText(
// //                       text: "Payments History",
// //                       color: Colors.green,
// //                       size: 20,
// //                       weight: FontWeight.bold,
// //                     ),
// //                     onTap: () async {
// //                       // paymentsController.getPaymentHistory();
// //                     },
// //                   ),
// //                   ListTile(
// //                     onTap: () {
// //                       _auth.signOut();
// //                     },
// //                     leading: const Icon(Icons.exit_to_app),
// //                     title: const Text("Log out"),
// //                   )
// //                 ],
// //               ),
// //             )),
// //         body: Container(
// //           color: Colors.white30,
// //           child: const ProductsWidget(),
// //         ));
// //   }
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// import '../../widgets/round_search_input.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Firebase',
//       home: AddData(),
//     );
//   }
// }

// class AddData extends StatelessWidget {
//   const AddData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text("geeksforgeeks"),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('products')
//             .where('email',
//                 isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           TextEditingController search = TextEditingController();

//           return ListView(
//             children: snapshot.data!.docs.map((document) {
//               return SingleChildScrollView(
//                   child: Container(
//                 //width: MediaQuery.of(context).size.width * 0.45,
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.secondary,
//                   boxShadow: [
//                     const BoxShadow(
//                       blurRadius: 4,
//                       color: Color(0x3600000F),
//                       offset: Offset(0, 2),
//                     )
//                   ],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             child: ClipRRect(
//                               borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(0),
//                                 bottomRight: Radius.circular(0),
//                                 topLeft: Radius.circular(8),
//                                 topRight: Radius.circular(8),
//                               ),
//                               child: Image.network(
//                                 document['image'].toString(),
//                                 width: 50,
//                                 height: 50,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   8, 4, 0, 0),
//                               child: Text(
//                                 FirebaseAuth.instance.currentUser!.email
//                                     .toString(),
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1
//                                     ?.copyWith(color: Colors.black),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsetsDirectional.fromSTEB(
//                                   8, 4, 0, 0),
//                               child: Text(
//                                 '\$${document['price']}',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText2
//                                     ?.copyWith(color: Colors.blue),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ));
//               // Center(child: Text(document['brand']));
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/screens/customer/customer_infor.dart';
import 'package:test_app/screens/product/search_product.dart';

import '../services/auth.dart';
import '../product/all_product.dart';
import '../cart/cart_page.dart';
import '../order/order.dart';
import '../saved/saved.dart';

class NhomePage extends StatefulWidget {
  const NhomePage({super.key});
  @override
  State<NhomePage> createState() => _NhomePageState();
}

class _NhomePageState extends State<NhomePage> with TickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String title = "";
  final searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 1, vsync: this);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Shopping App"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: const Text('AH'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              Container(
                padding: const EdgeInsets.all(15),
                child: Wrap(
                  runSpacing: 0,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home_outlined),
                      title: const Text("Home"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite_border),
                      title: const Text("Favourits"),
                      onTap: () {
                        Get.to(const Saved(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(seconds: 1));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart_outlined),
                      title: const Text("Cart"),
                      onTap: () {
                        Get.to(const NCartPage(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(seconds: 1));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.shopping_bag_outlined),
                      title: const Text("Orders"),
                      onTap: () {
                        Get.to(const OrderPage(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(seconds: 1));
                      },
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_outline_outlined),
                      title: const Text("Profile"),
                      onTap: () {
                        Get.to(const CustomInfo(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(seconds: 1));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout_outlined),
                      title: const Text("Logout"),
                      onTap: () async {
                        final AuthService auth = new AuthService();
                        await auth.signOut();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1)),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              title = value;
                            });
                          },
                          controller: searchController,
                          decoration: const InputDecoration(
                              hintStyle:
                                  TextStyle(fontWeight: FontWeight.normal),
                              border: InputBorder.none,
                              hintText: "Search Products"),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            title = searchController.text.toString();
                          });
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   height: 250,
            //   // color: Colors.amber,
            //   child: CarouselSlider(
            //     items: [
            //       Container(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             image: const DecorationImage(
            //                 fit: BoxFit.cover,
            //                 image: NetworkImage(
            //                     "https://sp.yimg.com/ib/th?&id=ODL.e6db74fa3c8dabc985f36a39957a3d1b"))),
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             image: const DecorationImage(
            //                 fit: BoxFit.cover,
            //                 image: NetworkImage(
            //                     "https://images.pexels.com/photos/19090/pexels-photo.jpg?cs=srgb&dl=fashion-footwear-shoes-19090.jpg&fm=jpg"))),
            //       ),
            //       Container(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             image: const DecorationImage(
            //                 fit: BoxFit.cover,
            //                 image: NetworkImage(
            //                     "https://tse1.mm.bing.net/th?id=OIP.t0gayE0LXgL9cdP3XVeBuwHaE7&pid=Api&P=0"))),
            //       ),
            //     ],
            //     options: CarouselOptions(
            //       height: 180.0,
            //       enlargeCenterPage: true,
            //       autoPlay: true,
            //       aspectRatio: 16 / 9,
            //       autoPlayCurve: Curves.fastOutSlowIn,
            //       enableInfiniteScroll: true,
            //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
            //       viewportFraction: 0.8,
            //     ),
            //   ),
            // ),
            TabBar(isScrollable: true, controller: tabController, tabs: const [
              Tab(
                child: Text(
                  "All",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]),
            const SizedBox(
              height: 1,
            ),
            SizedBox(
              height: 400,
              child: TabBarView(controller: tabController, children: <Widget>[
                AllProducts(
                  title: title,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      color: Colors.orange,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundColor: Colors.brown.shade800,
            child: const Text('AH'),
          ),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            FirebaseAuth.instance.currentUser!.email.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

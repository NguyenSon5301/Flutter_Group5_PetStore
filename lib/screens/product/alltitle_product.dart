import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllTile extends StatefulWidget {
  final String title;
  final String price;
  final String image;
  final String category;
  // final double opacity;

  final VoidCallback callback;
  const AllTile({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.callback,
    required this.category,
    // required this.opacity,
  }) : super(key: key);

  @override
  State<AllTile> createState() => _allTileState();
}

// ignore: camel_case_types
class _allTileState extends State<AllTile> {
  int select = 0;
  final List<IconData> allIcons = [Icons.favorite_border, Icons.favorite];

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(
      Radius.circular(20),
    );
    return Card(
      child: InkWell(
        borderRadius: borderRadius,
        onTap: widget.callback,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: borderRadius,
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Image.network(widget.image, width: 182, height: 182),
                  Positioned(
                    top: 16,
                    right: 2,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 200,
                        ),
                        IconButton(
                            onPressed: () {
                              DocumentReference documentReference =
                                  FirebaseFirestore.instance
                                      .collection('User')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.email
                                          .toString())
                                      .collection('Saved')
                                      .doc(widget.title);
                              Map<String, dynamic> add = {
                                'Title': widget.title.toString(),
                                'Price': widget.price.toString(),
                                'Image': widget.image.toString(),
                                'Category': widget.category.toString(),
                              };
                              setState(() {
                                if (select == 0) {
                                  select = 1;
                                  documentReference.set(add).then((value) =>
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  '${widget.title} is Saved...'))));
                                } else {
                                  select = 0;
                                  documentReference.delete().then((value) =>
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  '${widget.title} is Deleted...'))));
                                }
                              });
                            },
                            icon: Icon(
                              allIcons[select],
                              color: Colors.redAccent,
                              size: 30,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            FittedBox(
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // _buildSoldPoint(data.star, data.sold),
            // const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                Text(
                  '\$${widget.price.toString()}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
                const SizedBox(
                  width: 80,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal,
                    disabledForegroundColor: Colors.grey.withOpacity(0.38),
                    elevation: 5,
                  ),
                  onPressed: () {
                    DocumentReference documentReference = FirebaseFirestore
                        .instance
                        .collection('User')
                        .doc(
                            FirebaseAuth.instance.currentUser!.email.toString())
                        .collection('Cart')
                        .doc(widget.title);
                    Map<String, dynamic> add = {
                      'Title': widget.title.toString(),
                      'Price': widget.price.toString(),
                      'Image': widget.image.toString(),
                      'Quantity': 1.toString(),
                      'Category': widget.category.toString(),
                    };
                    documentReference.set(add).then((value) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('${widget.title} is added to cart'))));
                  },
                  child: const Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: GestureDetector(
//         onTap: widget.callback,
//         child: Container(
//             height: 10,
//             width: 10,
//             decoration: BoxDecoration(boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.3),
//                 blurRadius: 2.0,
//                 spreadRadius: 1.0,
//                 offset:
//                     const Offset(1.0, 1.0), // shadow direction: bottom right
//               )
//             ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
//             child: Row(
//               children: [
//                 Column(
//                   children: [
//                     Image.network(
//                       widget.image,
//                       height: 150,
//                       width: 100,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const SizedBox(
//                           width: 200,
//                         ),
//                         IconButton(
//                             onPressed: () {
//                               DocumentReference documentReference =
//                                   FirebaseFirestore.instance
//                                       .collection('User')
//                                       .doc(FirebaseAuth
//                                           .instance.currentUser!.email
//                                           .toString())
//                                       .collection('Saved')
//                                       .doc(widget.title);
//                               Map<String, dynamic> add = {
//                                 'Title': widget.title.toString(),
//                                 'Price': widget.price.toString(),
//                                 'Image': widget.image.toString(),
//                                 'Category': widget.category.toString(),
//                               };
//                               setState(() {
//                                 if (select == 0) {
//                                   select = 1;
//                                   documentReference.set(add).then((value) =>
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                               content: Text(
//                                                   '${widget.title} is Saved...'))));
//                                 } else {
//                                   select = 0;
//                                   documentReference.delete().then((value) =>
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                               content: Text(
//                                                   '${widget.title} is Deleted...'))));
//                                 }
//                               });
//                             },
//                             icon: Icon(allIcons[select]))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       width: 250,
//                       child: Text(
//                         widget.title,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                             color: Color.fromARGB(255, 190, 150, 90),
//                             fontFamily: 'roboto',
//                             fontSize: 18),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Price: ",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                               fontFamily: 'roboto'),
//                         ),
//                         Text(
//                           widget.price,
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                               fontFamily: 'roboto'),
//                         ),
//                         const SizedBox(
//                           width: 140,
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 100),
//                       child: MaterialButton(
//                         elevation: 0,
//                         color: Colors.black,
//                         onPressed: () {
//                           DocumentReference documentReference =
//                               FirebaseFirestore.instance
//                                   .collection('User')
//                                   .doc(FirebaseAuth.instance.currentUser!.email
//                                       .toString())
//                                   .collection('Cart')
//                                   .doc(widget.title);
//                           Map<String, dynamic> add = {
//                             'Title': widget.title.toString(),
//                             'Price': widget.price.toString(),
//                             'Image': widget.image.toString(),
//                             'Quantity': 1.toString(),
//                             'Category': widget.category.toString(),
//                           };
//                           documentReference.set(add).then((value) =>
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       content: Text(
//                                           '${widget.title} is added to cart'))));
//                         },
//                         child: const Icon(
//                           Icons.add_shopping_cart_rounded,
//                           color: Colors.white,
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             )),
//       ),
    // );
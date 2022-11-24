import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllTile extends StatefulWidget {
  final String title;
  final String price;
  final String image;
  // final double opacity;

  final VoidCallback callback;
  const AllTile({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.callback,
    // required this.opacity,
  }) : super(key: key);

  @override
  State<AllTile> createState() => _allTileState();
}

class _allTileState extends State<AllTile> {
  int select = 0;
  final List<IconData> allIcons = [Icons.star_border, Icons.star];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: widget.callback,
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset:
                    const Offset(1.0, 1.0), // shadow direction: bottom right
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.network(
                      widget.image,
                      height: 150,
                      width: 100,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                                'Image': widget.image.toString()
                              };
                              setState(() {
                                select = 1;
                              });
                              documentReference.set(add).then((value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              '${widget.title} is Saved...'))));
                            },
                            icon: Icon(allIcons[select]))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.orange,
                            fontFamily: 'roboto',
                            fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Rs. ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'roboto'),
                        ),
                        Text(
                          widget.price,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'roboto'),
                        ),
                        const SizedBox(
                          width: 140,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 170),
                      child: MaterialButton(
                        elevation: 0,
                        color: Colors.black,
                        onPressed: () {
                          DocumentReference documentReference =
                              FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(FirebaseAuth.instance.currentUser!.email
                                      .toString())
                                  .collection('Cart')
                                  .doc(widget.title);
                          Map<String, dynamic> add = {
                            'Title': widget.title.toString(),
                            'Price': widget.price.toString(),
                            'Image': widget.image.toString(),
                            'Quantity': 1.toString()
                          };
                          documentReference.set(add).then((value) =>
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${widget.title} is added to cart'))));
                        },
                        child: const Icon(
                          Icons.add_shopping_cart_rounded,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}

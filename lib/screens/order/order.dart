import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/order.dart';
import 'orderdetail.dart';
import 'orderlist.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Order> orders = [];
  final user = FirebaseAuth.instance.currentUser!;
  Stream<List<OrderList>> get firebaseOrder {
    return FirebaseFirestore.instance
        .collection('User')
        .doc(user.email.toString())
        .collection('Orders')
        .snapshots()
        .map(_firebaseOrderfromSnapShot);
  }

  List<OrderList> _firebaseOrderfromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      List<dynamic> orderMap = doc['Orders'];
      for (var element in orderMap) {
        orders.add(Order(
          element['Title'],
          element['Price'],
          element['Image'],
        ));
      }
      return OrderList(
        orders: orders,
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 55, 65),
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Your Orders',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(FirebaseAuth.instance.currentUser!.email.toString())
            .collection('Orders')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OrderDetail(
                                  orders: snapshot.data.docs[index]['Orders'],
                                )));
                      },
                      child: OrderTile(
                        orderNumber: snapshot.data.docs[index]['OrderNumber'],
                        name: snapshot.data.docs[index]['Name'],
                        email: snapshot.data.docs[index]['Email'],
                        block: snapshot.data.docs[index]['Block'],
                        street: snapshot.data.docs[index]['Street'],
                        landmark: snapshot.data.docs[index]['Landmark'],
                        city: snapshot.data.docs[index]['City'],
                        state: snapshot.data.docs[index]['State'],
                        pincode: snapshot.data.docs[index]['Pincode'],
                        phone: snapshot.data.docs[index]['Phone'],
                        date: snapshot.data.docs[index]['Date'],
                        payment: snapshot.data.docs[index]['Payment'],
                        total: snapshot.data.docs[index]['Total'],
                        status: snapshot.data.docs[index]['Status'],
                      )),
                );
              },
            );
          } else {
            return const Text('');
          }
        },
      ),
      // child: StreamBuilder(
      //   stream: firebaseOrder,
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if(snapshot.hasData){
      //       return OrderList(orders: orders);
      //     }
      //     else{
      //       return Text("Loading...");
      //     }
      //   },
      // ),
    );
  }
}

class OrderTile extends StatefulWidget {
  final String name;
  final int orderNumber;
  final String status;
  final String date;
  final String block;
  final String street;
  final String landmark;
  final String state;
  final String city;
  final String pincode;
  final String phone;
  final String email;
  final String payment;
  final int total;
  const OrderTile(
      {Key? key,
      required this.name,
      required this.orderNumber,
      required this.date,
      required this.block,
      required this.street,
      required this.landmark,
      required this.state,
      required this.city,
      required this.pincode,
      required this.phone,
      required this.email,
      required this.payment,
      required this.total,
      required this.status})
      : super(key: key);

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Date : ',
                  ),
                  Text(widget.date)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Status: ',
                  ),
                  Text(
                    widget.status,
                    style: TextStyle(
                        color: widget.status == 'Rejected By Admin'
                            ? Colors.red
                            : Colors.green),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    'Order Number : ',
                    style: TextStyle(color: Colors.orange, fontSize: 25),
                  ),
                  Text(
                    widget.orderNumber.toString(),
                    style: const TextStyle(color: Colors.orange, fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Customer Name: ',
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Address: ',
                      ),
                      Text(
                        widget.block,
                        style: const TextStyle(color: Colors.orange),
                      ),
                      const Text(',', style: TextStyle(color: Colors.orange)),
                      Text(
                        widget.street,
                        style: const TextStyle(color: Colors.orange),
                      ),
                      const Text(',', style: TextStyle(color: Colors.orange)),
                      Text(
                        widget.landmark,
                        style: const TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.city,
                        style: const TextStyle(color: Colors.orange),
                      ),
                      const Text(',', style: TextStyle(color: Colors.orange)),
                      Text(
                        widget.state,
                        style: const TextStyle(color: Colors.orange),
                      ),
                      const Text('-', style: TextStyle(color: Colors.orange)),
                      Text(
                        widget.pincode,
                        style: const TextStyle(color: Colors.orange),
                      ),
                      const Text('.', style: TextStyle(color: Colors.orange))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    'Email: ',
                  ),
                  Text(
                    widget.email,
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    'Phone: ',
                  ),
                  const Text('(+84)', style: TextStyle(color: Colors.orange)),
                  Text(
                    widget.phone,
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    'Payment: ',
                  ),
                  Text(
                    widget.payment,
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    'Total Amount: ',
                  ),
                  const Text('Rs.', style: TextStyle(color: Colors.orange)),
                  Text(
                    widget.total.toString(),
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }
}

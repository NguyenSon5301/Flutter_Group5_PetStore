import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget {
  final List orders;
  const OrderDetail({Key? key, required this.orders}) : super(key: key);

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(orders: json['Orders']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Items',
              style: TextStyle(color: Colors.white, fontFamily: 'roboto'),
            )),
        backgroundColor: const Color.fromARGB(255, 43, 55, 65),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 8, bottom: 8),
                              child: Image.network(
                                orders[index]['Image'],
                                height: 150,
                                width: 100,
                              ),
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
                            SizedBox(
                              width: 250,
                              child: Text(
                                orders[index]['Title'],
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
                                  orders[index]['Price'],
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
                          ],
                        )
                      ],
                    )));
          },
        ));
  }
}

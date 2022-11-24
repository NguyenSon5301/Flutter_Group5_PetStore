import 'package:flutter/material.dart';

import '../../models/order.dart';

class OrderList extends StatefulWidget {
  final List<Order> orders;
  const OrderList({Key? key, required this.orders}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: ((context, index) {
        return const SizedBox(
          height: 10,
        );
      }),
      itemCount: widget.orders.length.toInt(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.network(
                      widget.orders[index].image,
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
                    SizedBox(
                      width: 250,
                      child: Text(
                        widget.orders[index].title,
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
                          widget.orders[index].price,
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
            ));
      },
    );
  }
}

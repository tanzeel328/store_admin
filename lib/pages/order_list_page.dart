import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_admin/models/orderz.dart';
import 'package:store_admin/services/database_service.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  ODatabaseService _oDatabaseService = ODatabaseService();
  List<Orderz> orders = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(bottom: 12),
            height: 40,
            color: Colors.yellow,
            child: const Center(
              child: Text(
                'Orders List',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              builder: (context, snapshot) {
                List orders = snapshot.data?.docs.cast<dynamic>() ?? [];
                if (orders.isEmpty) {
                  return const Center(
                    child: Text('No Orders yet'),
                  );
                }
                // print(rooms);
                return ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    Orderz order = orders[index].data();
                    String orderId = orders[index].id;
                    // print(room);
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ExpansionTile(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Address : ${order.address}'),
                            Text(order.email),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order Date : ${DateFormat.yMMMd().format(order.orderTime.toDate())}',
                            ),
                            Text(
                              'Order Time : ${DateFormat.jm().format(order.orderTime.toDate())}',
                            ),
                            Text('Total Payment : ${order.total.toString()}'),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Confirmation'),
                                    content: const Text(
                                        'Are you sure you want to delete room?'),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Colors.yellow,
                                        textColor: Colors.white,
                                        child: const Text('Cancel'),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _oDatabaseService
                                              .deleteOrder(orderId);
                                        },
                                        color: Colors.yellow,
                                        textColor: Colors.white,
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        children: order.productz.map((product) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(color: Colors.grey),
                              ),
                              title: Text(product["title"].toString()),
                              subtitle:
                                  Text('Size: ${product["size"].toString()}'),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              },
              stream: _oDatabaseService.getOrderz(),
            ),
          )
        ],
      )),
    );
  }
}

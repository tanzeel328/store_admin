import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_admin/pages/order_list_page.dart';
import 'package:store_admin/pages/product_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 1;

  List<Widget> widgetList = [
    // const Dashboard(),
    const ProductListPage(),
    const OrderListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Set the status bar color to white
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Products Managment",
            style: TextStyle(color: Colors.yellow),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 102, 101, 101),
      ),
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: myIndex,
        children: widgetList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}

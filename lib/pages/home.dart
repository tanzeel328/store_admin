import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_admin/pages/order_list_page.dart';
import 'package:store_admin/pages/product_list.dart';

class Home extends StatefulWidget {
  final int? mIndex;

  Home({Key? key, this.mIndex}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0;

  List<Widget> widgetList = [
    const ProductListPage(),
    const OrderListPage(),
  ];

  @override
  void initState() {
    super.initState();
    // Set myIndex to mIndex if mIndex is not null
    if (widget.mIndex != null) {
      myIndex = widget.mIndex!;
    }
  }

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
            "Products Management",
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

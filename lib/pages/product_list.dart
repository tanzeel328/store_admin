import 'package:flutter/material.dart';
import 'package:store_admin/models/products.dart';
import 'package:store_admin/pages/product_add.dart';
import 'package:store_admin/services/database_service.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final DatabaseService _pdatabaseService = DatabaseService();
  bool deleter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              color: Colors.yellow,
              child: const Center(
                child: Text(
                  'Product List',
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
                builder: (Context, snapshot) {
                  List products = snapshot.data?.docs.cast<Object>() ?? [];

                  if (products.isEmpty) {
                    return const Center(
                      child: Text('Add Products!'),
                    );
                  }
                  // print(rooms);
                  return Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 1080) {
                          return GridView.builder(
                            itemCount: products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.75,
                            ),
                            itemBuilder: (context, index) {
                              Productz product = products[index].data();
                              String productId = products[index].id;
                              // _checked = product.inStock;
                              return Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: index.isEven
                                      ? const Color.fromARGB(255, 136, 212, 247)
                                      : const Color.fromARGB(
                                          255, 242, 171, 255),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'PKR ${product.price}',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(height: 5),
                                    Center(
                                      child: Image.network(product.image,
                                          height: 175),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Confirmation'),
                                                    content: const Text(
                                                        'Are you sure you want to delete room?'),
                                                    actions: [
                                                      MaterialButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        color: Colors.yellow,
                                                        textColor: Colors.black,
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      MaterialButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          _pdatabaseService
                                                              .deleteProduct(
                                                                  productId);
                                                        },
                                                        color: Colors.yellow,
                                                        textColor: Colors.black,
                                                        child: const Text(
                                                            'Delete'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 35,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              Productz product = products[index].data();
                              String productId = products[index].id;
                              // _checked = product.inStock;

                              return Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: index.isEven
                                      ? const Color.fromARGB(255, 136, 212, 247)
                                      : const Color.fromARGB(
                                          255, 242, 171, 255),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'PKR ${product.price}',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const SizedBox(height: 5),
                                    Center(
                                      child: Image.network(product.image,
                                          height: 175),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Confirmation'),
                                                    content: const Text(
                                                        'Are you sure you want to delete room?'),
                                                    actions: [
                                                      MaterialButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        color: Colors.yellow,
                                                        textColor: Colors.black,
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      MaterialButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          _pdatabaseService
                                                              .deleteProduct(
                                                                  productId);
                                                        },
                                                        color: Colors.yellow,
                                                        textColor: Colors.black,
                                                        child: const Text(
                                                            'Delete'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 35,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  );
                },
                stream: _pdatabaseService.getProduct(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductAddPage()),
          );
        },
        backgroundColor: Colors.yellow,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

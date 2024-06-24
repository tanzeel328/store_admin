import 'package:flutter/material.dart';
import 'package:store_admin/models/products.dart';
import 'package:store_admin/pages/home.dart';
import 'package:store_admin/pages/product_list.dart';
import 'package:store_admin/services/database_service.dart';
import 'package:store_admin/widgets/form_field_container_widget.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final DatabaseService _pdatabaseService = DatabaseService();
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController sizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                color: Colors.yellow,
                child: const Center(
                  child: Text(
                    'Add Product',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    FormFieldContainerWidget(
                      hintText: 'Product Title',
                      labelText: 'Product Title',
                      isPasswordField: false,
                      controller: titleController,
                    ),
                    const SizedBox(height: 10),
                    FormFieldContainerWidget(
                      hintText: 'Price',
                      labelText: 'Price',
                      isPasswordField: false,
                      controller: priceController,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    FormFieldContainerWidget(
                      hintText: 'Company',
                      labelText: 'Company',
                      isPasswordField: false,
                      controller: companyController,
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    FormFieldContainerWidget(
                      hintText: 'Image',
                      labelText: 'Image',
                      isPasswordField: false,
                      controller: imageController,
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    FormFieldContainerWidget(
                      hintText: 'Separate all Sizes with Commas(,)',
                      labelText: 'size',
                      isPasswordField: false,
                      controller: sizeController,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: MaterialButton(
                        onPressed: () {
                          if (titleController.text.isNotEmpty &&
                              companyController.text.isNotEmpty &&
                              priceController.text.isNotEmpty &&
                              imageController.text.isNotEmpty &&
                              sizeController.text.isNotEmpty) {
                            String input = sizeController.text;
                            Productz product = Productz(
                              // inStock: true,
                              company: companyController.text,
                              price: int.parse(priceController.text),
                              size: input
                                  .split(',')
                                  .map((String number) =>
                                      int.parse(number.trim()))
                                  .toList(),
                              title: titleController.text,
                              image: imageController.text,
                            );

                            _pdatabaseService.addProduct(
                              titleController.text,
                              product,
                            );
                            titleController.clear();
                            priceController.clear();
                            companyController.clear();
                            imageController.clear();
                            sizeController.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(
                                        mIndex: 0,
                                      )),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Center(child: Text('Fill all the fields!')),
                              ),
                            );
                          }
                        },
                        color: Colors.yellow,
                        height: 60,
                        mouseCursor: WidgetStateMouseCursor.clickable,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            Text(
                              'Add Product',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

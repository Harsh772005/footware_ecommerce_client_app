import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:footware_admin/Widgets/drop_down_button.dart';
import 'package:footware_admin/controller/home_controller.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Container(
              padding: EdgeInsets.only(left: 60),
              child: Text(
                'Add Product',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add New Product',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    // margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: ctrl.productNameCtrl,
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                        hintText: 'Enter Product Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    // margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: ctrl.productDescriptionCtrl,
                      decoration: InputDecoration(
                        labelText: 'Product Description',
                        hintText: 'Enter Product Description Here',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      maxLines: 5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    // margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: ctrl.productImageCtrl,
                      decoration: InputDecoration(
                        labelText: 'Image Url',
                        hintText: 'Enter Product Image Url',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    // margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: ctrl.productPriceCtrl,
                      decoration: InputDecoration(
                        labelText: 'Product Price',
                        hintText: 'Enter Product Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: DropDownButton(
                        items: ['Shoes', 'Sandle', 'Footware'],
                        SelectedItemText: ctrl.category,
                        onSelected: (selectedValue) {
                          ctrl.category = selectedValue ?? 'General';
                          ctrl.update();
                        },
                      )),
                      Flexible(
                          child: DropDownButton(
                        items: ['Puma', 'Adidas', 'Sparx'],
                        SelectedItemText: ctrl.brand,
                        onSelected: (selectedValue) {
                          ctrl.brand = selectedValue ?? 'Un branded';
                          ctrl.update();
                        },
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Offer Product ?"),
                  DropDownButton(
                    items: ['true', 'false'],
                    SelectedItemText: ctrl.offer.toString(),
                    onSelected: (selectedValue) {
                      ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                      ctrl.update() ;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    child: Text(
                      'Add Product',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:footware_admin/model/product/product.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productsCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  TextEditingController productImageCtrl = TextEditingController();

  String category = 'general';
  String brand = 'un branded';
  bool offer = false;

  // now we write code for accesing the data from the firebase
  List<Product> products = [];

  void onInit() async {
    productsCollection = firestore.collection('footwareproducts');
    await fetchProducts();
    super.onInit();
  }

  //for fetching product from the firebase data base
  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productsCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('Success', 'Product Fetch Suceesfully',colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(),colorText: Colors.red);
    }finally{
      update();
    }

  }

  deleteProduct(String id) async
  {
    try {
      await productsCollection.doc(id).delete();
      fetchProducts();
    } on Exception catch (e) {
      Get.snackbar('Error',e.toString(),colorText: Colors.red);
    }
  }

  addProduct() {
    try {
      DocumentReference doc = productsCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImageCtrl.text,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product added Successfully',
          colorText: Colors.green);
      setValueDefault();
    } on Exception catch (e) {
      Get.snackbar('error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  setValueDefault() {
    productNameCtrl.clear();
    productDescriptionCtrl.clear();
    productPriceCtrl.clear();
    productImageCtrl.clear();

    category = 'general';
    brand = 'un branded';
    offer = false;

    update();
  }
}

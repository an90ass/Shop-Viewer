import 'package:flutter/material.dart';
import 'package:http_demo/data_api/product_api.dart';
import 'package:http_demo/models/catagory.dart';
import 'package:http_demo/data_api/catagory_api.dart';
import 'package:http_demo/widgets/product_list_widget.dart';
import 'dart:convert';

import '../models/product.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  List<Catagory> catagories = [];
  List<Widget> catagoryWidgets = [];
  List<Product> products = [];

  @override
  void initState() {
    getCatagoriesFromApi();
    getProductsFromApi();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping System",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFF771F),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: catagoryWidgets,
              ),
            ),

            SingleChildScrollView(
                scrollDirection:Axis.vertical,
                child: ProductListWidget(products)),

          ],
        ),
      ),
    );
  }

  void getCatagoriesFromApi() {
    CategoryApi.getCatagories().then((response) {
      if (response.statusCode == 200) {
        setState(() {
          Iterable list = json.decode(response.body);
          this.catagories =
              list.map((catagory) => Catagory.fromJson(catagory)).toList();
          getCatagoryWidgets();
        });
      } else {
        print("Failed to load categories");
      }
    });
  }

  List<Widget> getCatagoryWidgets() {
    catagoryWidgets.clear();
    for (int i = 0; i < catagories.length; i++) {
      catagoryWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: getCatagoryWidget(catagories[i]),
        ),
      );
    }
    return catagoryWidgets;
  }

  Widget getCatagoryWidget(Catagory catagory) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          getProductsByCatagoryId(catagory);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFD5501A),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Color(0xFFFFDAB9)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      ),
      child: Text(
        catagory.categoryName ?? "No Name",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void getProductsByCatagoryId(Catagory category) {
    ProductAapi.getProductsByCatagoryId(category.id!).then((response) {
      if (response.statusCode == 200) {
        setState(() {
          Iterable list = json.decode(response.body);
          this.products =
              list.map((product) => Product.fromJson(product)).toList();
        });
      } else {
        print("Failed to load products");
      }
    });
  }

  void getProductsFromApi() {
    ProductAapi.getProducts().then((response) {
      if (response.statusCode == 200) {
        setState(() {
          Iterable list = json.decode(response.body);
          this.products =
              list.map((product) => Product.fromJson(product)).toList();
        });
      } else {
        print("Failed to load products");
      }
    });
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_demo/widgets/product_list_row.dart';

import '../models/product.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products = [];
  ProductListWidget(List<Product> products) {
    this.products = products;
  }

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgeState();
  }
}

class ProductListWidgeState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return
      Column(
        children: [
          SizedBox(height: 10.0,),
          SizedBox(
            height: 500,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ),
              ),
        ],
      );
  }
}

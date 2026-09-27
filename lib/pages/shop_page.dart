import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/my_drawer.dart';
import 'package:shop_app/components/my_product_tile.dart';
import 'package:shop_app/models/shop.dart';

class ShopPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop Page"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(height: 25),

          //shop subtitle
          Center(child: Text("Pick from a selected list of premium products")),
          SizedBox(height: 10),

          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: .horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                //get each individual product from shop
                final item = products[index];

                //return a product tile UI
                return MyProductTile(product: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

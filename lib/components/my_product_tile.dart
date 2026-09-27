import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    void addToCart(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
          content: Text("Add this item to your cart?"),
          contentPadding: EdgeInsets.all(25),
          actionsPadding: EdgeInsets.only(bottom: 6),
          actionsAlignment: .spaceBetween,
          actions: [
            //cancel button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),

            //yes button
            MaterialButton(
              onPressed: () {
                //pop dialog box
                Navigator.pop(context);

                //add to cart
                context.read<Shop>().addItemToCart(product);
              },
              child: Text("Yes"),
            ),
          ],
        ),
      );
    }

    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 30),

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Icon(Icons.favorite),
                ),
              ),
              SizedBox(height: 25),

              //product name
              Text(
                product.name,
                style: TextStyle(fontWeight: .bold, fontSize: 20),
              ),

              //product description
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
          //product price + add to cart button
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              //product price
              Text("\$${product.price}"),

              //add to cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

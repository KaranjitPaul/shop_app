import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/my_button.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        content: Text("Remove this item from your cart?"),
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
              context.read<Shop>().removeItemFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(content: Text("Payment Backened not yet added.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        
      ),
      body: cart.isEmpty
          ? Center(child: const Text("Your cart is empty.."))
          : Column(
              children: [
                //cart list
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in cart
                      final item = cart[index];

                      //return
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text("\$${item.price}"),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
                ),

                //pay button
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: MyButton(
                    onTap: () => payButtonPressed(context),
                    child: Text("Pay Now"),
                  ),
                ),
              ],
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop_app/components/my_button.dart';
import 'package:shop_app/utils/routes.dart';

class IntroPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 25),
            //title
            Text(
              "Minimal Shop",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            //subtitle
            Text(
              "Premium Quality Products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            SizedBox(height: 30),
            //button
            MyButton(
              onTap: () => Navigator.pushNamed(context, MyRoutes.ShopPage),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

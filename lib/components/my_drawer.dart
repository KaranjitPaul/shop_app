import 'package:flutter/material.dart';
import 'package:shop_app/components/my_list_tile.dart';
import 'package:shop_app/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            children: [
              //drawer header: logo
              DrawerHeader(
                margin: EdgeInsets.zero,
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(height: 20),

              //shop tile
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              //cart tile
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () => Navigator.pushNamed(context, MyRoutes.CartPage),
              ),
            ],
          ),

          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                MyRoutes.IntroPage,
                (route) => false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

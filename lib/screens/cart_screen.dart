import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:shoppee_app/costants.dart';
import 'package:shoppee_app/model/cart_item.dart';
import 'package:shoppee_app/screens/home_screen.dart';
import 'package:shoppee_app/view/widgets/product_widgets/cart_tile.dart';
import 'package:shoppee_app/view/widgets/product_widgets/check_out_box.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            icon: const Icon(Ionicons.chevron_back),
          ),
        ),
      ),
      bottomSheet: CheckOutBox(
        items: cartItems,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) => CartTile(
          item: cartItems[index],
          onRemove: () {
            if (cartItems[index].quantity != 1) {
              setState(() {
                cartItems[index].quantity--;
              });
            }
          },
          onAdd: () {
            setState(() {
              cartItems[index].quantity++;
            });
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: cartItems.length,
      ),
    );
  }
}
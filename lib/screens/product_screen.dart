import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:shoppee_app/costants.dart';
import 'package:shoppee_app/model/product.dart';
import 'package:shoppee_app/view/widgets/product_widgets/product/add.dart';
import 'package:shoppee_app/view/widgets/product_widgets/product/appbar.dart';
import 'package:shoppee_app/view/widgets/product_widgets/product/image_slider.dart';
import 'package:shoppee_app/view/widgets/product_widgets/product/information.dart';
import 'package:shoppee_app/view/widgets/product_widgets/product/product_desc.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentImage = 0;
  int currentColor = 0;
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      floatingActionButton: AddToCart(
        currentNumber: currentNumber,
        onAdd: () {
          setState(() {
            currentNumber++;
          });
        },
        onRemove: () {
          if (currentNumber != 1) {
            setState(() {
              currentNumber--;
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductAppBar(),
              ImageSlider(
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
                currentImage: currentImage,
                image: widget.product.image,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentImage == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: currentImage == index
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfo(product: widget.product),
                    const SizedBox(height: 20),
                   
                    // const SizedBox(height: 10),
                    
                    const SizedBox(height: 20),
                    ProductDescription(text: widget.product.description),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
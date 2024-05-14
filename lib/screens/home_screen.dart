import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

import 'package:shoppee_app/costants.dart';
import 'package:shoppee_app/model/category.dart';
import 'package:shoppee_app/model/product.dart';
import 'package:shoppee_app/view/widgets/product_widgets/cartegories.dart';
import 'package:shoppee_app/view/widgets/product_widgets/home_appbar.dart';
import 'package:shoppee_app/view/widgets/product_widgets/home_slider.dart';
import 'package:shoppee_app/view/widgets/product_widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 HomeAppBar(),
                Container(
                  child:Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    

                    Text("Hello Rocky ", style:TextStyle(
fontSize: 25,fontWeight: FontWeight.bold ,color: Colors.black

                    ) ,),

                   Text("lets gets somthings? ", style:TextStyle(
fontSize: 15,fontWeight: FontWeight.bold ,color: const Color.fromARGB(255, 125, 120, 120)

                    ) ,),  

                    ],
                  ),
                ),
                 SizedBox(height: 20),
             
              
                HomeSlider(
                  onChange: (value) {
                    setState(() {
                      currentSlide = value;
                    });
                  },
                currentSlide: 0,
  images: categoryImages,
                ),
                const SizedBox(height: 20),
                 Categories(),
                const SizedBox(height: 25),
               
                const SizedBox(height: 10),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                    childAspectRatio: 250,
                    mainAxisExtent: 250
                   
                  

                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    // return ProductCard(product: products[index]);
                    return SizedBox(
      height: 400, // Adjust the height as per your requirement
      child: ProductCard(product: products[index]),
    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
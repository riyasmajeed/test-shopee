import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoppee_app/costants.dart';
import 'package:shoppee_app/model/product.dart';
import 'package:shoppee_app/screens/product_screen.dart';
import 'package:shoppee_app/view/widgets/product_widgets/product/product_desc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: product),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
               color: kcontentColor,
             
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(product.image),
                      fit: BoxFit.cover,
                    ),

                    //  color: Colors.black
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     product.title,
                //     style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),

                //   ),

                  
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     "\$${product.price}",
                //     style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //     ),
                //   ),
                // ),

               
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(),
              child: Icon(
                Ionicons.heart,
                color: Color.fromARGB(255, 112, 107, 107),
                size: 18,
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            left: 15,
            child:Container(
           
              
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
 Text('Apple Watch  -M2',style: TextStyle(fontSize: 15,color: const Color.fromARGB(255, 130, 118, 118)),),
    Row(
      children: [
 Text('\$140',style: TextStyle(fontSize: 20,color: Colors.black),),
 Text('\$200',style: TextStyle(fontSize: 15,color: const Color.fromARGB(255, 130, 118, 118)),),

       
      ],
    )
  ],
),

          ))
        ],
      ),
    );
  }
}

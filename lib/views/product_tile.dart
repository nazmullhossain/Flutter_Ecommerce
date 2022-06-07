import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/model_porduct.dart';


class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Image.network(
                  product.imageLink!,
                  fit: BoxFit.cover,
                ),

              ),
              Positioned(
                right: 0,
                  child:Obx(()=> CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: product.isFavourite.value
                       ? Icon(Icons.favorite_rounded)
                      : Icon(Icons.favorite_border),

                      onPressed: () {
                        product.isFavourite.toggle();
                      },
                    ),
                  ))
    )
            ],
          ),
          SizedBox(height: 8,),
          Text(
            product.name!,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.w800),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8,),
          if(product.rating!=null)
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
                
              ),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                children: [
                  Text(
                    product.rating.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  ),
                  
                ],
              ),
            ),
          Text('\$${product.price}',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),)
          
          
          
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:testecommerce/views/product_tile.dart';
import '../controllers/product_controller.dart';
class HomePage extends StatelessWidget {
  final ProductController controller = Get.find();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('রস মিষ্টির সৃষ্টি'),
            centerTitle: true,
            elevation: 10,
            leading: const Icon(
              Icons.arrow_back_ios,
            ),
            actions: [
              IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Expanded(child: Text('রস মিষ্টির সৃষ্টি',
                      style: TextStyle(fontSize: 32,fontWeight: FontWeight.w900),
                    )),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.view_list_rounded)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.grid_view)),



                  ],
                ),
                ),
                Expanded(
                  child: Obx(() {
                    if(controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return   MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      itemCount: controller.product.length,
                      crossAxisSpacing: 10,


                      itemBuilder: (context, index) {
                        return ProductTile(controller.product[index]);
                      },

                    );
                    }

                  }
                  )

                  ),

              ],
            ),
          ),

        );
      }
    );
  }
}

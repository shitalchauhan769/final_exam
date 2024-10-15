import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../util/helper/db_helper.dart';
import '../../../util/helper/firdb_helper.dart';
import '../../home/controller/home_controller.dart';
import '../../home/model/home_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeController controller = Get.put(HomeController());

  TextEditingController txtName = TextEditingController();
  TextEditingController txtRecipe = TextEditingController();
  TextEditingController txtId = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("RecipeCart"),
      ),
      body: Obx(
        () =>  ListView.builder(
          itemCount: controller.recipeList.length,
          itemBuilder: (context, index) {
          return  Card(
            child: SizedBox(
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${controller.recipeList[index].name}"),
                        Text(
                          "${controller.recipeList[index].recipe}",
                          style: const TextStyle(),
                          overflow: TextOverflow.ellipsis,),

                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        FireHelper.helper.deleteData(dId: controller.recipeList[index].id!);
                        controller.getData();

                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          );
        },),
      ),
    );
  }
}

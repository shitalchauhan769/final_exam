import 'package:final_exam/screen/home/controller/home_controller.dart';
import 'package:final_exam/screen/home/model/db_model.dart';
import 'package:final_exam/screen/home/model/home_model.dart';
import 'package:final_exam/util/helper/db_helper.dart';
import 'package:final_exam/util/helper/firdb_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  TextEditingController txtName = TextEditingController();
  TextEditingController txtRecipe = TextEditingController();
  TextEditingController txtId = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.getDataDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(child: Text("RecipeApp")),
        actions: [
          IconButton(onPressed: () {
            Get.toNamed("/cart");

          }, icon: const Icon(Icons.shopping_cart),),
        ],
      ),
      body: Obx(
        () =>  ListView.builder(
            itemCount: controller.dbList.length,
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
                                Text("${controller.dbList[index].name}"),
                                Text(
                                "${controller.dbList[index].recipe}",
                                style: const TextStyle(),
                                overflow: TextOverflow.ellipsis,),

                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  HomeModel h1=HomeModel(id: controller.dbList[index].id!,recipe:controller.dbList[index].recipe! ,name: controller.dbList[index].name!);
                                  FireHelper.helper.addData(h1);

                                  controller.getData();
                                },
                                icon: const Icon(Icons.favorite),
                              ),
                              IconButton(
                                onPressed: () {
                                  DbHelper.dbHelper.deleteDb(id:controller.dbList[index].id);
                                  controller.getDataDB();

                                },
                                icon: const Icon(Icons.delete),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              );
            },
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          showDialogBoxe();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showDialogBoxe() {
    Get.defaultDialog(
      backgroundColor: Colors.green,
      title: "Add Recipe",
      content: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: txtName,
              decoration: const InputDecoration(
                label: Text("Name"),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Name enter";
                }
                return null;
              },
            ),
            TextFormField(
              controller: txtRecipe,
              decoration: const InputDecoration(
                label: Text("Recipe"),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Recipe enter";
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                       DBModel d1 = DBModel(name: txtName.text,recipe: txtRecipe.text);
                       DbHelper.dbHelper.insertDb(d1);
                       controller.getDataDB();
                       txtName.clear();
                       txtRecipe.clear();
                      Get.back();
                      Get.snackbar("database", "database is successfully");
                    }
                  },
                  child: const Text("Save"),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("cancel"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

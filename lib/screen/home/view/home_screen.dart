import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RecipeApp"),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width,
                  child:  const ListTile(
                    title: Text("Hello"),
                    trailing: Row(
                      children: [
                        Icon(Icons.favorite),
                        Icon(Icons.bookmark),
                      ],
                    ),
                    subtitle: Text("Recipe",style: TextStyle(),overflow: TextOverflow.ellipsis,),
                  ),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogBoxe();
        },
        child: const Text("Add"),
      ),
    );
  }
  void showDialogBoxe()
  {
   Get.defaultDialog(
     title: "Add Recipe",
     actions: [
        Column(
         children: [
           TextFormField(
             decoration: InputDecoration(
               label: Text("Name"),
             ),
           ),
           TextFormField(
             decoration: const InputDecoration(
               label: Text("Recipe"),
             ),
           ),

         ],
       )
     ]
   );
  }
}

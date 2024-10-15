
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../screen/home/model/home_model.dart';


class FireHelper
{
  static FireHelper helper=FireHelper._();
  FireHelper._();

  var firebase = FirebaseFirestore.instance;
  void addData(HomeModel model) {
    firebase.collection("Recipe").add({"name": model.name,"recipe":model.recipe,"id":model.id});
  }
  Future<List<HomeModel>> readData()
  async {
    QuerySnapshot data = await firebase.collection("Recipe").get();
    List<QueryDocumentSnapshot<Object?>>d1=data.docs;
    List<HomeModel> m1=d1.map((e) => HomeModel.mapToModel(e.data()!as Map,e.id),).toList();
    return m1;
  }

  Future<void>  deleteData({int? dId})
  async {
   await  firebase.collection("Recipe").doc().delete();
  }
}

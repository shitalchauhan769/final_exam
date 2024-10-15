
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../screen/home/model/home_model.dart';


class FireHelper
{
  static FireHelper helper=FireHelper._();
  FireHelper._();

  var firebase = FirebaseFirestore.instance;
  void addData(HomeModel model) {
    firebase.collection("Recipe").add({"name": model.name,"recipe":model.recipe,});
  }
  Future<List<HomeModel>> readData()
  async {
    QuerySnapshot data = await firebase.collection("Recipe").get();
    List<QueryDocumentSnapshot<Object?>>d1=data.docs;
    List<HomeModel> m1=d1.map((e) => HomeModel.mapToModel(e.data()!as Map,e.id),).toList();
    return m1;
  }

  Future<void>  deleteData(String dId)
  async {
   await  firebase.collection("Recipe").doc(dId).delete();
  }
}

// import '../../screen/home/model/home_model.dart';
//
// class FirestoreHelper{
//   static FirestoreHelper fireDBHelper= FirestoreHelper._();
//   FirestoreHelper._();
//   var db = FirebaseFirestore.instance;
//   Future<void> addData(FireStoreModel model)
//   async {
//     await db.collection("Recipe").add({"name":model.name,"price":model.price,"dec":model.dec,"image":model.image});
//   }
//   // Future<List<FireStoreModel>> readData()
//   // async {
//   //   // QuerySnapshot qds=await db.collection("shopping").get();
//   //   List<QueryDocumentSnapshot<Object?>> qd=qds.docs;
//   //   List<FireStoreModel> model=qd.map((e) => FireStoreModel.mapToModel(e?.data()! as Map,e.id),).toList();
//   //   return model;
//   // }
//   Future<void> updateData(FireStoreModel model)
//   async {
//     await db.collection("Recipe").doc(model.id).set({"name":model.name,"price":model.price,"dec":model.dec,"image":model.image});
//   }
//   Future<void> deleteData(String dId)
//   async {
//     await db.collection("Recipe").doc(dId).delete();
//   }
// }
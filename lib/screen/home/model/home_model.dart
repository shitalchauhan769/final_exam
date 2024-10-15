class FireStoreModel{
  String? id,name,dec,recipe;
  double? price;

  FireStoreModel({this.id,required this.name,required this.dec,required this.recipe,required this.price});
  factory FireStoreModel.mapToModel(Map m1,String dId)
  {
    return FireStoreModel(id: dId, name: m1["name"], dec: m1["dec"], recipe: m1["recipe"], price: m1["price"]);
  }
}
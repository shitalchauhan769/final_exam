class HomeModel{
  String?  name,recipe;
  int?id;


  HomeModel({this.name, this.id, this.recipe});

  factory HomeModel.mapToModel(Map m1, String dId) {
    return HomeModel(
        name: m1["name"],
        id: m1["id"],
        recipe: m1["recipe"],
       );
  }
}

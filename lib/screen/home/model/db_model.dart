class DBModel
{
  String?  name,recipe;
  int?id;

  DBModel({this.name, this.recipe,this.id});
  factory DBModel.mapToModel(Map m1)
  {
    return DBModel(recipe: m1["recipe"],name: m1['name'],id: m1['id']);
  }
}
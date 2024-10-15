import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../util/helper/db_helper.dart';
import '../../../util/helper/firdb_helper.dart';
import '../model/db_model.dart';
import '../model/home_model.dart';



class HomeController extends GetxController
{
  RxList<HomeModel> recipeList=<HomeModel>[].obs;
  Future<void> getData() async {
  List<HomeModel>l1 = await FireHelper.helper.readData();
  recipeList.value=l1;
  print("========$recipeList");

  }
  RxList<DBModel>dbList=<DBModel>[].obs;
  Future<void> getDataDB()
  async {
    dbList.value = await DbHelper.dbHelper.redDb();

  }

}
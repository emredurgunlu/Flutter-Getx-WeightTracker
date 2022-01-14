import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import '../models/nutrition.dart';

class RemoteApi extends GetxController {
  final textEdit = TextEditingController();

  late final nutritionList = Future.value(<NutritionModel>[]).obs;
  String query = "";
  final String apiUrl = 'https://api.calorieninjas.com/v1/nutrition?query=';
  Dio dio = Dio();
  Future<List<NutritionModel>> fetchList() async {
    try {
      dio.options.headers['X-Api-Key'] =//Please input your own api key. don't use my api key permanently. My API key is limited monthly.
          "oBs5NFiJ0rtUHaEta3urLg==NQLIH0orh75dLfDG";
      Response response = await dio.get(apiUrl + query);
      List<NutritionModel> _nutritionList = [];
      if (response.statusCode == 200) {
        _nutritionList = (response.data["items"] as List)
            .map((e) => NutritionModel.fromMap(e))
            .toList();
      }
      return _nutritionList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  @override
  void onClose() {
    textEdit.dispose();
    super.onClose();
  }
}

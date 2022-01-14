import 'package:get/state_manager.dart';

class RecordWeight {
  RxString today = "".obs;
  String weight = "";

  RecordWeight(String today, this.weight) {
    this.today.value = today;
  }
}

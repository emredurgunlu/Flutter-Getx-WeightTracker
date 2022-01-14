import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:date_format/date_format.dart';
import '../models/record_weight.dart';

class Controller extends GetxController {
  final List record = <RecordWeight>[].obs;
  final Rx<MaterialColor> threeColor = Colors.indigo.obs;
  final currentWeight = 100.obs;
  final box = GetStorage();
  List dbToday = [];
  List dbWeight = [];

  void initState() {
    if (box.read("dbToday") != null) {
      dbToday = box.read("dbToday");
      dbWeight = box.read("dbWeight");
      for (int i = 0; i < dbToday.length; i++) {
        record.add(RecordWeight(dbToday[i], dbWeight[i]));
      }
    }
  }

  void addRecord() {
    record.add(RecordWeight(formatDate(DateTime.now(), [yy, '-', M, '-', d]),
        currentWeight.value.toString()));
    dbToday.add(record.last.today.value);
    dbWeight.add(record.last.weight);
    box.write("dbToday", dbToday);
    box.write("dbWeight", dbWeight);
  }

  void editDate(RecordWeight element, selectedDate) {
    int index = record.indexOf(element);
    record[index].today.value =
        formatDate(selectedDate, [yy, '-', M, '-', d]).toString();
    dbToday[index] = formatDate(selectedDate, [yy, '-', M, '-', d]).toString();
    box.write("dbToday", dbToday);
  }

  void delete(RecordWeight element) {
    record.remove(element);
    dbToday.remove(element.today.value);
    dbWeight.remove(element.weight);
    box.write("dbToday", dbToday);
    box.write("dbWeight", dbWeight);
  }

  @override
  void onInit() {
    initState();
    super.onInit();
  }
}

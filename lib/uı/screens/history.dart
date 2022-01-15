import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/record_row.dart';
import '../../controller/controller.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();

    return Padding(
      padding: EdgeInsets.fromLTRB((Get.width / 25), 8, (Get.width / 25), 8),
      child: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          children: c.record.map((a) => RecordRow(element: a)).toList(),
          reverse: true,
        ),
      ),
    );
  }
}

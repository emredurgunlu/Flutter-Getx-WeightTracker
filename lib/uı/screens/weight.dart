import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:numberpicker/numberpicker.dart';
import '../../controller/controller.dart';

class Weight extends StatelessWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    c.currentWeight.value = 100;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Obx(
              () => NumberPicker(
                minValue: 1,
                maxValue: 1000,
                value: c.currentWeight.value,
                onChanged: (value) => (c.currentWeight.value = value),
                axis: Axis.horizontal,
                itemCount: 3,
                itemHeight: 60,
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.indigo,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          Flexible(
            child: Image.asset(
              'assets/images/weightIcon.jpg',
            ),
          ),
          Material(
            color: Colors.indigo,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: c.addRecord,
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "SAVE",
                  style: TextStyle(fontSize: 40, color: Colors.yellow),
                ),
                width: 300,
              ),
            ),
          )
        ],
      ),
    );
  }
}

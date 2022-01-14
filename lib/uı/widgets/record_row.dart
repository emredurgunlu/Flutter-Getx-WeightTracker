import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import '../../controller/controller.dart';
import '../../models/record_weight.dart';

class RecordRow extends StatelessWidget {
  final RecordWeight element;
  const RecordRow({required this.element, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();
    DateTime _selectedDate = DateTime.now();
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) async {
              _selectedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate:
                          _selectedDate.subtract(const Duration(days: 365)),
                      lastDate: _selectedDate.add(const Duration(days: 30))) ??
                  _selectedDate;
              c.editDate(element, _selectedDate);
            },
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (_) {
              c.delete(element);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.green,
              width: 3,
            ),
          ),
          elevation: 5,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => Text(
                    element.today.value,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
                Text(
                  element.weight,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

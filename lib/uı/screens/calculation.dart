import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/left_column.dart';
import '../../models/nutrition.dart';
import '../../controller/remote_api.dart';

class Calculation extends StatelessWidget {
  const Calculation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RemoteApi r = Get.find();

    return Column(
      children: [
        TextField(
          textAlign: TextAlign.center,
          autofocus: true,
          cursorColor: Colors.black,
          controller: r.textEdit,
          onChanged: (String value1) {
            r.textEdit.value = TextEditingValue(
              text: value1,
              selection: TextSelection.collapsed(offset: value1.length),
            );
          },
          onSubmitted: (String value2) {
            r.query = value2;
            r.textEdit.value = const TextEditingValue(
              text: "",
            );
            r.nutritionList.value = r.fetchList();
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Hello",
                    content: SizedBox(
                      width: Get.width / 2,
                      child: const Text(
                        "Please input a text containing food or drink items. If you wish to calculate a specific quantity, you may prefix a quantity before an item. For example, 3 tomatoes and 1lb beef brisket and 300g potato. If no quantity is specified, the default quantity is 100 grams.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.info)),
          ),
        ),
        Obx(
          () => FutureBuilder<List<NutritionModel>>(
            future: r.nutritionList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var userList = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      var user = userList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const LeftColumn(),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.yellow, Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(user.name),
                                  Text(user.calories.toString()),
                                  Text(user.proteinG.toString()),
                                  Text(user.carbohydratesTotalG.toString()),
                                  Text(user.fatTotalG.toString()),
                                  Text(user.fatSaturatedG.toString()),
                                  Text(user.cholesterolMg.toString()),
                                  Text(user.sugarG.toString()),
                                  Text(user.fiberG.toString()),
                                  Text(user.potassiumMg.toString()),
                                  Text(user.sodiumMg.toString()),
                                  Text(user.servingSizeG.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return const Text(
                    "An error occured.\nplease check your internet connection");
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}

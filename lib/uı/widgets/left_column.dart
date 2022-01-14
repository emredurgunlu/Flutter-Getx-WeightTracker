import 'package:flutter/material.dart';

class LeftColumn extends StatelessWidget {
  const LeftColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text("name:"),
          Text("calories:"),
          Text("proteinG:"),
          Text("carbohydratesTotalG:"),
          Text("fatTotalG:"),
          Text("fatSaturatedG:"),
          Text("cholesterolMg:"),
          Text("sugarG:"),
          Text("fiberG:"),
          Text("potassiumMg:"),
          Text("sodiumMg:"),
          Text("servingSizeG:"),
        ],
      ),
    );
  }
}

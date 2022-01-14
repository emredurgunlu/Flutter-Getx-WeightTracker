import 'dart:convert';

NutritionModel nutritionModelFromMap(String str) =>
    NutritionModel.fromMap(json.decode(str));

String nutritionModelToMap(NutritionModel data) => json.encode(data.toMap());

class NutritionModel {
  NutritionModel({
    required this.sugarG,
    required this.fiberG,
    required this.servingSizeG,
    required this.sodiumMg,
    required this.name,
    required this.potassiumMg,
    required this.fatSaturatedG,
    required this.fatTotalG,
    required this.calories,
    required this.cholesterolMg,
    required this.proteinG,
    required this.carbohydratesTotalG,
  });

  final double sugarG;
  final num fiberG;
  final double servingSizeG;
  final num sodiumMg;
  final String name;
  final num potassiumMg;
  final double fatSaturatedG;
  final double fatTotalG;
  final double calories;
  final num cholesterolMg;
  final double proteinG;
  final double carbohydratesTotalG;

  factory NutritionModel.fromMap(Map<String, dynamic> json) => NutritionModel(
        sugarG: json["sugar_g"].toDouble(),
        fiberG: json["fiber_g"],
        servingSizeG: json["serving_size_g"].toDouble(),
        sodiumMg: json["sodium_mg"],
        name: json["name"],
        potassiumMg: json["potassium_mg"],
        fatSaturatedG: json["fat_saturated_g"].toDouble(),
        fatTotalG: json["fat_total_g"].toDouble(),
        calories: json["calories"].toDouble(),
        cholesterolMg: json["cholesterol_mg"],
        proteinG: json["protein_g"].toDouble(),
        carbohydratesTotalG: json["carbohydrates_total_g"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "sugar_g": sugarG,
        "fiber_g": fiberG,
        "serving_size_g": servingSizeG,
        "sodium_mg": sodiumMg,
        "name": name,
        "potassium_mg": potassiumMg,
        "fat_saturated_g": fatSaturatedG,
        "fat_total_g": fatTotalG,
        "calories": calories,
        "cholesterol_mg": cholesterolMg,
        "protein_g": proteinG,
        "carbohydrates_total_g": carbohydratesTotalG,
      };
}

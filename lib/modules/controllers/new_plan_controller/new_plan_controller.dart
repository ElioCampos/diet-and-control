import 'package:diet_and_control/modules/providers/new_plan_provider/new_plan_provider.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class NewPlanController extends GetxController {
  final RxInt planId = 0.obs;

  final RxInt currentDay = 0.obs;
  final RxList mealsFromToday = [].obs;
  final RxList dList = [].obs;
  final RxList aList = [].obs;
  final RxList cList = [].obs;
  final RxList sList = [].obs;
  final RxMap orderedMeals = {}.obs;

  final RxDouble carbo = 0.0.obs;
  final RxDouble fat = 0.0.obs;
  final RxDouble protein = 0.0.obs;
  final RxDouble totalKcal = 0.0.obs;

  final Map mealsCount = {
    "Desayuno": 2,
    "Almuerzo": 3,
    "Cena": 2,
    "Snack": 1,
  };

  final logger = Logger(
    printer: PrettyPrinter(),
  );

  final RxBool loading = false.obs;
  final RxList menus = [].obs;

  Future getPlan(int carbo, int protein, int fat) async {
    loading.value = true;
    dio.Response response;
    try {
      response = await NewPlanProvider()
          .getPlan(carbo: carbo, protein: protein, fat: fat);
      if (response.statusCode == 201 || response.statusCode == 200) {
        planId.value = response.data["id"];
        menus.value = response.data["menus"];
        refreshMeals();
        loading.value = false;
      } else {
        logger.i(response.statusCode);
        loading.value = false;
      }
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  decreaseDay() {
    if (currentDay.value > 0) {
      currentDay.value--;
    } else {
      currentDay.value = 6;
    }
    refreshMeals();
  }

  increaseDay() {
    if (currentDay.value < 6) {
      currentDay.value++;
    } else {
      currentDay.value = 0;
    }
    refreshMeals();
  }

  refreshMeals() {
    dList.clear();
    aList.clear();
    cList.clear();
    sList.clear();
    mealsFromToday.value = menus[currentDay.value]["meal_schedules"];
    for (var i = 0; i < 8; i++) {
      switch (i) {
        case 0:
        case 1:
          {
            dList.add(mealsFromToday[i]["meal"]);
          }
          break;
        case 2:
        case 3:
        case 4:
          {
            aList.add(mealsFromToday[i]["meal"]);
          }
          break;
        case 5:
        case 6:
          {
            cList.add(mealsFromToday[i]["meal"]);
          }
          break;
        case 7:
          {
            sList.add(mealsFromToday[i]["meal"]);
          }
      }
    }
    orderedMeals.value = {
      "Desayuno": dList,
      "Almuerzo": aList,
      "Cena": cList,
      "Snack": sList
    };
  }

  double roundDecimal(double d) {
    return double.parse((d).toStringAsFixed(1));
  }

  nutritionalData(double c, double f, double p) {
    carbo.value = roundDecimal(c);
    fat.value = roundDecimal(f);
    protein.value = roundDecimal(p);
    totalKcal.value = roundDecimal(carbo.value + fat.value + protein.value);
  }

  double totalKcalByType(List list) {
    double kcal = 0.0;
    for (var meal in list) {
      kcal += double.parse((meal["carbohydrate_kcal"]).toStringAsFixed(1)) +
          double.parse((meal["fat_kcal"]).toStringAsFixed(1)) +
          double.parse((meal["protein_kcal"]).toStringAsFixed(1));
    }
    kcal = double.parse((kcal).toStringAsFixed(1));
    return kcal;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

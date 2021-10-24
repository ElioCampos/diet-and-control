import 'package:diet_and_control/modules/controllers/patient_home_controller/patient_home_controller.dart';
import 'package:diet_and_control/modules/providers/new_plan_provider/new_plan_provider.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class NewPlanController extends GetxController {
  final RxInt planId = 0.obs;

  final RxInt currentMeal = 0.obs;
  final RxInt currentDay = 0.obs;
  final RxList mealsFromToday = [].obs;
  final RxList mealSchedule = [].obs;
  final RxList dList = [].obs;
  final RxList aList = [].obs;
  final RxList cList = [].obs;
  final RxList sList = [].obs;
  final RxMap orderedMeals = {}.obs;

  final RxList menuMon = [].obs;
  final RxList menuTue = [].obs;
  final RxList menuWed = [].obs;
  final RxList menuThu = [].obs;
  final RxList menuFri = [].obs;
  final RxList menuSat = [].obs;
  final RxList menuSun = [].obs;

  final RxMap menuIds = {}.obs;

  final RxBool mealChanged = false.obs;

  final RxDouble carbo = 0.0.obs;
  final RxDouble fat = 0.0.obs;
  final RxDouble protein = 0.0.obs;
  final RxDouble totalKcal = 0.0.obs;

  final RxInt personal_treatmentId = 0.obs;

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
  final RxBool dialogloading = false.obs;
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

  Future assignPlan() async {
    dio.Response response;
    try {
      response = await NewPlanProvider().assignPlan(planId.value);
      if (response.statusCode == 201 || response.statusCode == 200) {
        logger.i(response.data);
      } else {
        logger.i(response.statusCode);
      }
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }


Future getMealSchedule(String schedule, int index) async {
    dio.Response response;
    try {
      dialogloading.value = true;
      String schedule2 = "";
      mealSchedule.value = [];
      switch (schedule) {
        case "Desayuno": {schedule2 = "BREAKFAST"+ (index+1).toString(); } break;
        case "Almuerzo":{schedule2 = "LUNCH"+ (index+1).toString();} break;
        case "Cena": {schedule2 = "DINNER"+ (index+1).toString();} break;
        case "Snack": {schedule2 = "SNACK";} 
      }     
      response = await NewPlanProvider().getMealSchedule(schedule2);
      mealSchedule.value = await response.data;  
      logger.i(response.data); 
      if (mealSchedule.isNotEmpty){
        currentMeal.value = mealSchedule.indexWhere((element) => element["meal"]["id"] == orderedMeals[schedule][index]["id"]);        
        dialogloading.value = false;} 
    } on Exception catch (e) {
      logger.e(e);
      dialogloading.value = false;
    }
  }


Future updateTreatment(menuList) async {
    loading.value = true;
    dio.Response response;
    try {
      response = await NewPlanProvider()
          .updateTreatment(personal_treatmentId.value, menuList);
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.find<PatientHomeController>()
                .getPatientPlan(response.data["patient_id"], true);
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

  getmenuids(){
    // for(var i = 0; i < 7; i++){
    //   for(var j = 0; j < 8; j++){
    //      menuIds.values.elementAt(i)[j] = menus[i]["meal_schedules"][j]["id"];
    //    }  
    // }
    menuMon.value = [ for(var j = 0; j < 8; j++){menus[0]["meal_schedules"][j]["id"],} ];
    menuTue.value = [ for(var j = 0; j < 8; j++){menus[1]["meal_schedules"][j]["id"],} ];
    menuWed.value = [ for(var j = 0; j < 8; j++){menus[2]["meal_schedules"][j]["id"],} ];
    menuThu.value = [ for(var j = 0; j < 8; j++){menus[3]["meal_schedules"][j]["id"],} ];
    menuFri.value = [ for(var j = 0; j < 8; j++){menus[4]["meal_schedules"][j]["id"],} ];
    menuSat.value = [ for(var j = 0; j < 8; j++){menus[5]["meal_schedules"][j]["id"],} ];
    menuSun.value = [ for(var j = 0; j < 8; j++){menus[6]["meal_schedules"][j]["id"],} ];
  }
  
  editmenuid(int date, String type, int index, int newvalue){
    int typemeal = -1;
    mealChanged.value = false;
    switch (type) {
        case "Desayuno": {typemeal = 0 + index; } break;
        case "Almuerzo":{typemeal = 2 + index;} break;
        case "Cena": {typemeal = 5 + index;} break;
        case "Snack": {typemeal = 7;} 
    } 
    if (typemeal!=-1) {
    switch (date) {
        case 0: {menuMon[typemeal]=newvalue;mealChanged.value = true;} break;
        case 1: {menuTue[typemeal]=newvalue;mealChanged.value = true;} break;
        case 2: {menuWed[typemeal]=newvalue;mealChanged.value = true;} break;
        case 3: {menuThu[typemeal]=newvalue;mealChanged.value = true;} break;
        case 4: {menuFri[typemeal]=newvalue;mealChanged.value = true;} break;
        case 5: {menuSat[typemeal]=newvalue;mealChanged.value = true;} break;
        case 6: {menuSun[typemeal]=newvalue;mealChanged.value = true;} break;
    } }    
  }

  decreaseMeal() {
    if (currentMeal.value > 0) {
      currentMeal.value--;
    } else {
      currentMeal.value = mealSchedule.length;
    }
    refreshMeals();
  }

  increaseMeal() {
    if (currentMeal.value < mealSchedule.length) {
      currentMeal.value++;
    } else {
      currentMeal.value = 0;
    }
    refreshMeals();
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
    //mealsFromToday.sort((a, b) => a["schedule"].compareTo(b["schedule"]));   
    

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

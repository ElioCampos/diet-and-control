import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class NewPatientController extends GetxController {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  //*Datps pérsonales
  late final TextEditingController nameController;
  late final TextEditingController bornController;
  late final TextEditingController phoneController;
  late final TextEditingController dniController;
  DateTime date = new DateTime.now();
  final RxString dateFormat = "".obs;
  final RxString valueChooseActivity = "Seleccionar".obs;
  final RxString valueChooseSex = "Seleccionar".obs;
  final List sex = ["Seleccionar", "Hombre", "Mujer"];
  final List activities = [
    "Seleccionar",
    "Poco o ningún",
    "Ejercicio ligero",
    "Ejercicio moderado",
    "Ejercicio fuerte",
    "Ejercicio muy fuerte"
  ];

  //*Evaluacion antropometrica
  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController armController;
  late TextEditingController abdomenController;
  late TextEditingController hipsController;

  //*Estadp de salud
  final RxString valueChooseActual = "Seleccionar".obs;
  final RxString valueChooseAnt = "Seleccionar".obs;
  final List enfermedades = [
    "Seleccionar",
    "Postrado en cama",
    "Baja actividad"
  ];

  //*Repartición
  final columns = ["%", "Kcal", "g", "g/Kg"];

  final List options = [];

  final RxBool loading = false.obs;

  final RxInt carbohydrates = 0.obs;
  final RxInt protein = 0.obs;
  final RxInt fat = 0.obs;

  late TextEditingController carbohydrateController;
  late TextEditingController proteinController;
  late TextEditingController fatController;

  late TextEditingController tmbController;
  final RxString icmIndice = "0".obs;
  final RxString tbmIndice = "0".obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    bornController = TextEditingController();
    phoneController = TextEditingController();
    dniController = TextEditingController();

    weightController = TextEditingController();
    heightController = TextEditingController();
    armController = TextEditingController();
    abdomenController = TextEditingController();
    hipsController = TextEditingController();

    carbohydrateController = TextEditingController();
    proteinController = TextEditingController();
    fatController = TextEditingController();

    carbohydrateController.text = carbohydrates.value.toString();
    proteinController.text = protein.value.toString();
    fatController.text = fat.value.toString();

    tmbController = TextEditingController();
  }

  void calcIcmTmb() {
    String weight = weightController.text;
    String height = heightController.text;
    if (weight.length == 0 || height.length == 0) {
      icmIndice.value = "0";
    } else {
      icmIndice.value = ((double.parse(weight) * 10000.00) /
              (double.parse(height) * double.parse(height)))
          .toStringAsFixed(2);

      if (valueChooseSex.value != "Seleccionar" ||
          valueChooseActivity.value != "Seleccionar") {
        int age = DateTime.now().year - date.year;
        double tbmAns;
        double factor;
        if (activities[1] == valueChooseActivity.value)
          factor = 1.2;
        else if (activities[2] == valueChooseActivity.value)
          factor = 1.375;
        else if (activities[3] == valueChooseActivity.value)
          factor = 1.55;
        else if (activities[4] == valueChooseActivity.value)
          factor = 1.725;
        else
          factor = 1.9;
        if (valueChooseSex.value == "Hombre") {
          tbmAns = (66.00 +
                  13.7 * double.parse(height) +
                  5 * double.parse(height) -
                  6.8 * age) *
              factor;
        } else if (valueChooseSex.value == "Mujer") {
          tbmAns = (655.00 +
                  9.6 * double.parse(height) +
                  1.8 * double.parse(height) -
                  4.7 * age) *
              factor;
        } else {
          tbmAns = 0;
        }
        print(tbmIndice.value);
        tbmIndice.value = tbmAns.toStringAsFixed(2);
      } else {
        tbmIndice.value = "0";
      }
    }
  }

  Future getSesion() async {
    loading.value = true;
    dio.Response response;
    try {
      /* response = await LoginProvider()
          .getSession(usernameController.text, passwordController.text);
      if (response.statusCode == 201 || response.statusCode == 200) {
        loading.value = false;
      } else {
        logger.i(response.statusCode);
        loading.value = false;
      } */
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

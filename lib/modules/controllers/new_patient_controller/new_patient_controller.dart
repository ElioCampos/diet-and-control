import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/modules/providers/new_patient_provider/new_patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class NewPatientController extends GetxController {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  //*Datps pérsonales
  late final TextEditingController userController;

  late final TextEditingController emailController;
  late final TextEditingController passController;
  late final TextEditingController nameController;
  late final TextEditingController lastNameController;
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
  List enfermedades = [
    "Seleccionar",
  ];
  final RxList<dynamic> harmfulHabits = [].obs;
  final RxList<dynamic> illnesses = [].obs;

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
    userController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    nameController = TextEditingController();
    lastNameController = TextEditingController();
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
                  13.7 * double.parse(weight) +
                  5 * double.parse(height) -
                  // 5 * double.parse(height) / 100 -
                  6.8 * age) *
              factor;
        } else if (valueChooseSex.value == "Mujer") {
          tbmAns = (655.00 +
                  9.6 * double.parse(weight) +
                  // 1.8 * double.parse(height) / 100 -
                  1.8 * double.parse(height) -
                  4.7 * age) *
              factor;
        } else {
          tbmAns = 0;
        }
        print(tbmIndice.value);
        tbmIndice.value = tbmAns.toStringAsFixed(2);
        tmbController.text = tbmAns.toStringAsFixed(2);
      } else {
        tbmIndice.value = "0";
      }
    }
  }

  Future getHarmfulHabits() async {
    loading.value = true;
    dio.Response response;
    try {
      response = await NewPatientProvider().getHarmfulHabits();
      logger.i(response.data);
      harmfulHabits.value = response.data;
      loading.value = false;
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  Future getIllnesses() async {
    loading.value = true;
    dio.Response response;
    try {
      response = await NewPatientProvider().getIllnesses();
      logger.i(response.data);
      illnesses.value = response.data;
      enfermedades = [
        "Seleccionar",
      ];
      for (var illness in illnesses) {
        enfermedades.add(illness["name"]);
      }
      loading.value = false;
    } on Exception catch (e) {
      logger.e(e);
      loading.value = false;
    }
  }

  Future createUserProfile() async {
    int patientId = Get.find<AuthController>().patientId.value;
    bool gender = false;
    if (valueChooseSex.value == "Hombre") {
      gender = true;
    }
    dio.Response response;
    try {
      response = await NewPatientProvider().createUserProfile(
          userId: patientId,
          firstName: nameController.text,
          lastName: lastNameController.text,
          birthDate: date,
          phone: phoneController.text,
          sex: gender,
          doi: dniController.text,
          type: "patient");
      logger.i(response.data);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  Future postIllness() async {
    int patientId = Get.find<AuthController>().patientId.value;
    int illnessId = 0;
    for (var illness in illnesses) {
      if (illness["name"] == valueChooseActual.value) {
        illnessId = illness["id"];
      }
    }
    dio.Response response;
    try {
      response = await NewPatientProvider()
          .postIllness(patientId: patientId, illnessId: illnessId);
      logger.i(response.data);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  Future updateProfile() async {
    int patientId = Get.find<AuthController>().patientId.value;
    dio.Response response;
    try {
      response = await NewPatientProvider().updateProfile(
          patientId: patientId,
          imc: double.parse(icmIndice.value),
          tmb: double.parse(tbmIndice.value),
          height: double.parse(heightController.text),
          weight: double.parse(weightController.text),
          arm: double.parse(armController.text),
          abdominal: double.parse(abdomenController.text),
          hip: double.parse(hipsController.text));
      logger.i(response.data);
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

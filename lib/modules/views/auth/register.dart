import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/utils/validators.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield_email.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield_password.dart';
import 'package:diet_and_control/widgets/authWidget/roudend_button.dart';
import 'package:diet_and_control/widgets/authWidget/rounded_button_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'login.dart';

bool emailValid = true;
bool nameValid = true;
bool userValid = true;
bool passValid = true;
bool repeatPassValid = true;

class Register extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => controller.loading.value
              ? Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: LoadingIndicator(
                      colors: [Colors.green],
                      indicatorType: Indicator.ballClipRotateMultiple,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Image.asset("assets/logoLogin.png",
                                height: 150.0),
                          ),
                          CustomTextField(
                              hintText: "Nombres",
                              isValid: nameValid,
                              icon: Icons.api,
                              controller: controller.nameController,
                              onChanged: (value) {}),
                          CustomTextField(
                              hintText: "Usuario",
                              isValid: userValid,
                              icon: Icons.person,
                              controller: controller.usernameController,
                              onChanged: (value) {}),
                          CustomEmailField(
                              hintText: "Email",
                              isValid: emailValid,
                              icon: Icons.email,
                              controller: controller.emailController,
                              onChanged: (value) {}),
                          CustomTextFieldPassword(
                              controller: controller.passwordController,
                              title: "Contraseña",
                              onChanged: (value) {},
                              isRepeat: false),
                          CustomTextFieldPassword(
                              controller: controller.passwordController,
                              title: "Repetir Contraseña",
                              onChanged: (value) {},
                              isRepeat: true,
                              repeatController:
                                  controller.repeatPasswordController),
                          RoundedButton(
                            title: "Crear cuenta",
                            onTap: () async {
                              emailValid =
                                  validateEmail(controller.emailController);
                              controller.nameController.text.isNotEmpty
                                  ? nameValid = true
                                  : nameValid = false;
                              controller.usernameController.text.isNotEmpty
                                  ? userValid = true
                                  : userValid = false;
                              controller.passwordController.text.isNotEmpty
                                  ? passValid = true
                                  : passValid = false;
                              controller.repeatPasswordController.text ==
                                      controller.passwordController.text
                                  ? repeatPassValid = true
                                  : repeatPassValid = false;
                              if (nameValid &&
                                  emailValid &&
                                  userValid &&
                                  passValid &&
                                  repeatPassValid) {
                                await controller.signUpUser();
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 1.5,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                              Text(
                                " o ",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Container(
                                height: 1.5,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                            ],
                          ),
                          RoundedButtonRegister(
                            title: "Inicia sesión",
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

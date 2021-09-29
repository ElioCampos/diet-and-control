import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield_password.dart';
import 'package:diet_and_control/widgets/authWidget/roudend_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
                              icon: Icons.api,
                              controller: controller.nameController,
                              onChanged: (value) {}),
                          CustomTextField(
                              hintText: "Usuario",
                              icon: Icons.person,
                              controller: controller.usernameController,
                              onChanged: (value) {}),
                          CustomTextField(
                              hintText: "Email",
                              icon: Icons.email,
                              controller: controller.emailController,
                              onChanged: (value) {}),
                          CustomTextFieldPassword(
                              controller: controller.passwordController,
                              title: "Contraseña",
                              onChanged: (value) {}),
                          CustomTextFieldPassword(
                              controller: controller.repeatPasswordController,
                              title: "Repetir Contraseña",
                              onChanged: (value) {}),
                          RoundedButton(
                            title: "Registrar",
                            onTap: () async {
                              await controller.signUpUser();
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
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 30.0),
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 97, 29, 1),
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3.0,
                                        color: Colors.grey,
                                        offset: Offset(1.0, 2.0))
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      "assets/google.png",
                                      height: 30.0,
                                    ),
                                    Text(
                                      "Registrate con Google",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ]),
                            ),
                          )
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

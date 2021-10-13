import 'package:diet_and_control/modules/controllers/auth_controller/auth_controller.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield_password.dart';
import 'package:diet_and_control/widgets/authWidget/roudend_button.dart';
import 'package:diet_and_control/widgets/authWidget/rounded_button_register.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'register.dart';

bool emailValid = true;
bool passValid = true;

class Login extends GetView<AuthController> {
  final snackBar = SnackBar(content: Text("Credenciales incorrectas."));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
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
                            padding: const EdgeInsets.symmetric(vertical: 70.0),
                            child: Image.asset("assets/logoLogin.png",
                                height: 200.0),
                          ),
                          CustomTextField(
                            hintText: "Usuario",
                            icon: Icons.person,
                            onChanged: (value) {},
                            controller: controller.usernameController,
                            isValid: userValid,
                          ),
                          CustomTextFieldPassword(
                            title: "Contraseña",
                            controller: controller.passwordController,
                            onChanged: (value) {},
                            isRepeat: false,
                          ),
                          RoundedButton(
                            title: "Iniciar sesión",
                            onTap: () async {
                              controller.usernameController.text.isNotEmpty
                                  ? userValid = true
                                  : userValid = false;
                              controller.passwordController.text.isNotEmpty
                                  ? passValid = true
                                  : passValid = false;
                              if (userValid && passValid) {
                                await controller.getSesion();
                                if (controller.accountNotFound.value) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
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
                            title: "Crea una cuenta",
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
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

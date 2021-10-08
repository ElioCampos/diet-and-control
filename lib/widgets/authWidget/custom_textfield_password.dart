import 'package:diet_and_control/utils/validators.dart';
import 'package:diet_and_control/widgets/authWidget/textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidatorController extends GetxController {
  var hidePassword = true.obs;
  toggleVisibility() => hidePassword.value = !(hidePassword.value);
}

class CustomTextFieldPassword extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final bool isRepeat;
  final String title;
  final TextEditingController controller;
  final TextEditingController? repeatController;
  const CustomTextFieldPassword(
      {Key? key,
      required this.onChanged,
      required this.isRepeat,
      required this.title,
      required this.controller,
      this.repeatController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValidatorController c = Get.put(ValidatorController());
    controller.text = "passdepepe";
    return Obx(
      () => TextFieldContainer(
        child: TextField(
          obscureText: c.hidePassword.value,
          onChanged: onChanged,
          controller: isRepeat ? repeatController : controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              Icons.lock,
              color: Color.fromRGBO(0, 214, 129, 1),
            ),
            hintText: title,
            errorText: isRepeat
                ? errorPassword(controller.text, repeatController!.text)
                : errorPassword(controller.text, null),
            suffixIcon: _visibilityIcon(),
          ),
        ),
      ),
    );
  }

  Widget _visibilityIcon() {
    final ValidatorController c = Get.find();
    return IconButton(
        onPressed: () {
          c.toggleVisibility();
        },
        icon: c.hidePassword.value
            ? Icon(Icons.visibility, color: Color.fromRGBO(0, 214, 129, 1))
            : Icon(Icons.visibility_off,
                color: Color.fromRGBO(0, 214, 129, 1)));
  }
}

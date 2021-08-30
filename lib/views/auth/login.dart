import 'package:diet_and_control/views/auth/register.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield_password.dart';
import 'package:diet_and_control/widgets/authWidget/roudend_button.dart';
import 'package:diet_and_control/widgets/authWidget/rounded_button_register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 70.0),
                    child: Image.asset("assets/logoLogin.png", height: 200.0),
                  ),
                  CustomTextField(
                    hintText: "Usuario",
                    icon: Icons.person,
                    onChanged: (value){
        
                    },
                  ),
                  CustomTextFieldPassword(
                    title: "Contraseña",
                    onChanged: (value){
        
                    },
                  ),
                  RoundedButton(
                    title: "Iniciar Sesión",
                    onTap: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.5,
                        width: MediaQuery.of(context).size.width*0.4,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                      Text(" o ", style: TextStyle(fontSize: 20.0),),
                      Container(
                        height: 1.5,
                        width: MediaQuery.of(context).size.width*0.4,
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ],
                  ),
                  RoundedButtonRegister(
                    title: "Registrate",
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register()
                        )
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


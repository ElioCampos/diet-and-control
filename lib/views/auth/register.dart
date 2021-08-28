import 'package:diet_and_control/views/auth/login.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield.dart';
import 'package:diet_and_control/widgets/authWidget/custom_textfield_password.dart';
import 'package:diet_and_control/widgets/authWidget/roudend_button.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.asset("assets/logoLogin.png", height: 150.0),
                  ),
                  CustomTextField(
                    hintText: "Nombres", 
                    icon: Icons.api, 
                    onChanged: (value){
      
                    }
                  ),
                  CustomTextField(
                    hintText: "Usuario", 
                    icon: Icons.person, 
                    onChanged: (value){
      
                    }
                  ),
                  CustomTextField(
                    hintText: "Email", 
                    icon: Icons.email, 
                    onChanged: (value){
      
                    }
                  ),
                  CustomTextFieldPassword(
                    title: "Contraseña",
                    onChanged: (value){
      
                    }
                  ),
                  CustomTextFieldPassword(
                    title: "Repetir Contraseña",
                    onChanged: (value){
      
                    }
                  ),
                  RoundedButton(
                    title: "Registrar",
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login()
                        )
                      );
                    },
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
                  GestureDetector(
                    onTap: (){
      
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 30.0),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      width: MediaQuery.of(context).size.width*0.7,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 97, 29, 1),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Colors.grey,
                            offset: Offset(1.0, 2.0)
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/google.png", height: 30.0,),
                          Text(
                            "Registrate con Google",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                            ),
                          ),
                        ]
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
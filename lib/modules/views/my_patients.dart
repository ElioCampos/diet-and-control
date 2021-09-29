import 'package:diet_and_control/models/patient.dart';
import 'package:diet_and_control/modules/views/view_plan.dart';

import 'package:diet_and_control/widgets/myPatients/button_patients.dart';
import 'package:diet_and_control/widgets/myPatients/data_patient.dart';
import 'package:diet_and_control/widgets/myPatients/view_status.dart';
import 'package:flutter/material.dart';

class MyPatients extends StatefulWidget {
  
  const MyPatients({ 
    Key? key
  }) : super(key: key);

  @override
  _MyPatientsState createState() => _MyPatientsState();
}

class _MyPatientsState extends State<MyPatients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/logo.png', height: 70.0,),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                        width: 250.0,
                        child: Text(
                          "Mis Pacientes",
                          style: TextStyle(
                            color: Color.fromRGBO(59, 203, 90, 1.0),
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                  ],
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: pacientes.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1.0,
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                            SizedBox(height: 8.0,),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 35.0,
                                  backgroundImage: NetworkImage(pacientes[index].photo),
                                ),
                                SizedBox(width: 20.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DataPatient(data: "Nombre: "+pacientes[index].name),
                                    DataPatient(data: "Enfermedad: "+pacientes[index].enfermedad),
                                    DataPatient(data: "Progreso: "+pacientes[index].status),
                                  ],
                                )
                              ],
                            ),
                            ViewStatus(paciente: pacientes[index]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonPatients(
                                  title: "Ver Perfil", 
                                  onTap: (){}),
                                ButtonPatients(
                                  title: "Ver plan nutricional", 
                                  onTap: (){
                                     Navigator.push(
                                       context, 
                                       MaterialPageRoute(builder: (context) => ViewPlan(paciente: pacientes[index],))
                                     );
                                  })
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
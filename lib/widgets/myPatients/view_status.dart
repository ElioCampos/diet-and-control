import 'package:diet_and_control/models/patient.dart';
import 'package:diet_and_control/modules/controllers/view_status_controller/view_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ViewStatus extends StatefulWidget {
//   final Paciente paciente;
//   const ViewStatus({Key? key, required this.paciente}) : super(key: key);

//   @override
//   _ViewStatusState createState() => _ViewStatusState();
// }

class ViewStatus extends GetView<ViewStatusController> {
  final Paciente paciente;

  ViewStatus(this.paciente);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: paciente.statusDay.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: statusColor(
                              controller.planTrace[index]["success"])),
                    ),
                    Text(
                      paciente.statusDay.keys.elementAt(index),
                      style: TextStyle(
                          color: Color.fromRGBO(7, 87, 55, 1),
                          fontWeight: FontWeight.bold),
                    )
                  ]);
                })
          ],
        ));
  }

  Color statusColor(value) {
    if (!value) {
      return Color.fromRGBO(109, 109, 109, 1);
    } else {
      return Color.fromRGBO(0, 214, 129, 1);
    }
  }
}

import 'package:diet_and_control/models/patient.dart';
import 'package:flutter/material.dart';

class ListPacientes extends StatefulWidget {
  const ListPacientes({Key? key}) : super(key: key);

  @override
  _ListPacientesState createState() => _ListPacientesState();
}

class _ListPacientesState extends State<ListPacientes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
      height: 305.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color.fromRGBO(148, 148, 148, 0.1),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 0.7,
            color: Color.fromRGBO(218, 218, 218, 1.0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Text(
              "Lista de Pacientes",
              style: TextStyle(
                  color: Color.fromRGBO(59, 203, 90, 1.0), fontSize: 23.0),
            ),
          ),
          Container(
            height: 235.0,
            child: ListView.builder(
                itemCount: pacientes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 160.0,
                    margin: EdgeInsets.only(left: 10.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0))
                        ]),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          width: 140.0,
                          child: Text(
                            pacientes[index].name,
                            style: TextStyle(
                                color: Color.fromRGBO(93, 93, 93, 1.0),
                                fontSize: 17.0),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                                NetworkImage(pacientes[index].photo),
                          ),
                        ),
                        Container(
                          width: 140.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3.0),
                                child: Text(
                                  pacientes[index].diagnosis,
                                  style: TextStyle(
                                    color: Color.fromRGBO(93, 93, 93, 1.0),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3.0),
                                child: Text(
                                    "Progreso: " +
                                        pacientes[index].progress.toString(),
                                    style: TextStyle(
                                      color: Color.fromRGBO(93, 93, 93, 1.0),
                                    )),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              "Ver Perfil",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 214, 129, 1.0),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

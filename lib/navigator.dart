import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diet_and_control/utils/text_style.dart';
import 'package:diet_and_control/views/create_plan.dart';
import 'package:diet_and_control/views/home_nutritionist.dart';
import 'package:diet_and_control/views/home_patient.dart';
import 'package:diet_and_control/views/messages_page.dart';
import 'package:diet_and_control/views/my_patients.dart';
import 'package:diet_and_control/views/new_patient.dart';
import 'package:diet_and_control/views/view_plan.dart';
import 'package:flutter/material.dart';

class MainNavigator extends StatefulWidget {
  final bool isPatient;
  const MainNavigator({Key? key, required this.isPatient}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  List<Widget> _routes = [HomePatient(), HomePatient(), HomePatient()];
  List<Widget> _routesN = [];
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    _routesN = [
      HomeNutricionista(
        navigate: changeRoute,
      ),
      NuevoPaciente(goToCreatePlan: togglePlanRoute,),
      MyPatients(),
      MessagesPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activePage,
        children: widget.isPatient ? _routes : _routesN,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _activePage,
        backgroundColor: Colors.transparent,
        items: _options(widget.isPatient),
        onTap: (index) {
          setState(() {
            _activePage = index;
          });
        },
      ),
    );
  }

  List<Widget> _options(bool isPatient) {
    if (isPatient) {
      return <Widget>[
        ImageIcon(
          AssetImage('assets/logoicon.png'),
          color: customGreen,
          size: 30,
        ),
        Icon(
          Icons.calendar_today,
          size: 30,
          color: customGreen,
        ),
        Icon(
          Icons.forum,
          size: 30,
          color: customGreen,
        ),
      ];
    } else {
      return <Widget>[
        ImageIcon(
          AssetImage('assets/logoicon.png'),
          color: customGreen,
          size: 30,
        ),
        Icon(
          Icons.person_add,
          size: 30,
          color: customGreen,
        ),
        Icon(
          Icons.group,
          size: 30,
          color: customGreen,
        ),
        Icon(
          Icons.forum,
          size: 30,
          color: customGreen,
        ),
      ];
    }
  }

  changeRoute(r) {
    setState(() {
      _activePage = r;
    });
  }

  togglePlanRoute(a) {
    setState(() {
      a
          ? _routesN[1] = CreatePlan(confirmPlan: togglePlanRoute,)
          : _routesN[1] = NuevoPaciente(goToCreatePlan: togglePlanRoute,);
    });
  }
}

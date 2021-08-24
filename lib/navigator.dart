import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diet_and_control/views/home_nutritionist.dart';
import 'package:diet_and_control/views/home_patient.dart';
import 'package:flutter/material.dart';

final List<Widget> _routes = [HomePatient(), HomePatient(), HomePatient()];
final List<Widget> _routesN = [
  HomeNutricionista(),
  HomeNutricionista(),
  HomeNutricionista(),
  HomeNutricionista()
];
int _activePage = 0;
Color customGreen = Color.fromRGBO(0, 214, 129, 1.0);

class MainNavigator extends StatefulWidget {
  final bool isPatient;
  const MainNavigator({Key? key, required this.isPatient}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.isPatient ? _routes[_activePage] : _routesN[_activePage],
      bottomNavigationBar: CurvedNavigationBar(
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
          Icons.person,
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
}

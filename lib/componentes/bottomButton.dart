import 'package:flutter/material.dart';
import 'package:porto_hack_santos/constans.dart';
import 'package:porto_hack_santos/screens/perfil_screen.dart';

class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.notifications),
          title: new Text('Alertas'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.dashboard),
          title: new Text('Informações de Carga'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Perfil'),
        )
      ],
    );
  }

  void _onItemTapped(int index) {
//    if (index == 2) Navigator.push();
  }
}

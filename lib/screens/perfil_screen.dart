import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  static const String id = 'perfil_screen';

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 35.0,
              backgroundImage: null,
            ),
            Text(
              '',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A3A3E),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Color(0xFF707070),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'Skills',
              style: TextStyle(
                color: Color(0xFF626262),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'Treinamentos',
              style: TextStyle(
                color: Color(0xFF626262),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(onPressed: null, child: Text('ALTERAR')),
                  ),
                  Expanded(
                    child: FlatButton(onPressed: null, child: Text('OK!')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:porto_hack_santos/componentes/rounded_button.dart';
import 'package:porto_hack_santos/componentes/topo.dart';

class PerfilScreen extends StatefulWidget {
  static const String id = 'perfil_screen';

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topoTela(nomePagina: 'Alertas'),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://scontent.fudi1-2.fna.fbcdn.net/v/t1.0-9/64449332_2721331774563110_2820441453472251904_n.jpg?_nc_cat=100&_nc_ohc=1QjarINsu90AQlws2w89Y6wUkdsoevsnSboVoUdqrmqYsAM6bNO1Zujig&_nc_ht=scontent.fudi1-2.fna&oh=f72c4ec5c78df7c5ae2696aa36dfb72f&oe=5E697CAE',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              backgroundColor: Colors.transparent,
              radius: 80.0,
            ),
            Text(
              'CARLOS DOKI',
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
              height: 40,
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
              height: 10,
            ),
            Text(
              'Treinamento de combate de incendio de celulose',
              style: TextStyle(
                color: Color(0xFF626262),
                fontSize: 15,
              ),
            ),
            Text(
              'Treinamento de primeiros socorros',
              style: TextStyle(
                color: Color(0xFF626262),
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RoundedButton(
                      title: 'ALTERAR',
                      colour: Color(0xFF626262),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(
                    child: RoundedButton(
                      title: 'OK',
                      colour: Color(0xFFFFE367),
                    ),
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

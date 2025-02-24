import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          setState(() {
            contador++;
          });
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffb44093),
              title: Center(
                child: const Text(
                  'Hola Mundo :)',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Swar',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Image.network('https://th.bing.com/th/id/R.96e51b0a8aca7e32759709dee24562e4?rik=bwtXP5Vs6qvT2A&riu=http%3a%2f%2fsmb.org.mx%2fwp-content%2fuploads%2f2018%2f01%2flogo-celaya.png&ehk=O0QjtXZWSOtAPGI2XQQ2xY3D56yDAC2Y7QOPZaJRzXc%3d&risl=&pid=ImgRaw&r=0'),
              //Icon(
                //Icons.ads_click,
                //color: Colors.blueAccent
                //),
              onPressed: () {
                //setState(() {
                  //contador++;
                //});
              }),
            body: Center(
              child: Text(
                'Valor del contador $contador',
                style: TextStyle(fontSize: 20),
              ),
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025_2/screens/list_students_screen.dart';
import 'package:pmsn2025_2/utils/global_values.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidating = false;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextFormField(
      decoration: InputDecoration(
        labelText: "Usuario",
        hintText: 'Introduce el usuario',
        border: OutlineInputBorder(),
      ),
    );

    final txtPass = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: 'Introduce la contraseña',
        border: OutlineInputBorder(),
      ),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: .5,
              fit: BoxFit.cover,
              image: AssetImage("assets/fondo.jpg")),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 330,
              child: ValueListenableBuilder( //isValidating ? CircularProgressIndicator() : Container(),
                valueListenable: GlobalValues.isValidating, 
                builder: (context, value, child){
                  return value ? CircularProgressIndicator() : Container();
                },
                ),
            ),
            Positioned(
                top: 100,
                child: Lottie.asset("assets/tecnm.json", height: 250)),
            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 250,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    txtUser,
                    const SizedBox(
                      height: 10,
                    ),
                    txtPass,
                    GestureDetector(
                      onTap: () {
                        //isValidating = true;
                        GlobalValues.isValidating.value = true;
                        Future.delayed(Duration(milliseconds: 4000)).then(
                          (value) {
                            GlobalValues.isValidating.value = false;
                            Navigator.pushNamed(context, "/list");
                          },
                        );
                      }, //Navigator.push(context, MaterialPageRoute(builder: (context) => ListStudentsScreen(),)),
                      child: Image.asset(
                        "assets/boton.png",
                        height: 80,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pmsn2025_2/Places/views/item_place_image2.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key, required this.lugar});
  final Map<String, dynamic> lugar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 28, left: 28, right: 28),
            child: Column(
              children: [
                ItemPlaceImage(lugar: lugar),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 32),
                  child: Row(
                    spacing: 32,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto"),
                      ),
                      Text(
                        'Details',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 30,
                  children: [
                    Row(
                      spacing: 6,
                      children: [
                        Stack(children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color.fromRGBO(237, 237, 237, 1),
                            ),
                          ),
                          Positioned(
                            left: 9,
                            top: 9,
                            child: SvgPicture.asset(
                              "assets/assets/icons/icon_clock.svg", width: 16, height: 16,
                            ),
                          ),
                        ]),
                        Text(
                          lugar["tiempo"] + " hours",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(126, 126, 126, 1),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Stack(children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color.fromRGBO(237, 237, 237, 1),
                            ),
                          ),
                          Positioned(
                            left: 9,
                            top: 9,
                            child: SvgPicture.asset(
                              "assets/assets/icons/icon_cloud.svg",width: 16, height: 16,
                            ),
                          ),
                        ]),
                        Text(
                          lugar["temperatura"] +" °C",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(126, 126, 126, 1),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Stack(children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color.fromRGBO(237, 237, 237, 1),
                            ),
                          ),
                          Positioned(
                            left: 9,
                            top: 9,
                            child: SvgPicture.asset(
                              "assets/assets/icons/Star.svg",width: 16, height: 16,
                            ),
                          ),
                        ]),
                        Text(
                          lugar["calificacion"],
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(126, 126, 126, 1),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 36),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      lugar["descripcion"],
                      style: TextStyle(fontSize: 18.0, color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.all(26.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white10,
              Colors.white,
            ],
            stops: [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: FloatingActionButton(   
          backgroundColor: Colors.black,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                "Book Now",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              SvgPicture.asset(
                "assets/assets/icons/send_icon.svg",
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/*
bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white10,
              Colors.white30,
              Colors.white,
            ],
            //stops: [0.0,0.5, 1.0],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),





ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text(
                  "This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. "
                  "It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and lush valleys. "
                  "The Andes are also home to a wide array of unique flora and fauna, making them one of the most "
                  "ecologically significant regions in the world.",
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                ),
                const SizedBox(height: 400), // Simula más contenido para el scroll
              ],
            ),

            // Degradado en la parte inferior
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100, // Altura del degradado
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white10, // Transparente en la parte superior
                      Colors.white,   // Blanco sólido en la parte inferior
                    ],
                  ),
                ),
              ),
            ),
 Botón fijo en la parte inferior
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Acción del botón
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                  icon: const Icon(Icons.send, size: 20),
                  label: const Text("Book Now", style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
            */

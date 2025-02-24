import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemPlaceImage extends StatelessWidget {
  final Map<String, dynamic> lugar;

  const ItemPlaceImage({super.key, required this.lugar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .869,
      height: MediaQuery.of(context).size.height * .50,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(image: NetworkImage(lugar["imgUrl"]), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 19,
            top: 18,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color.fromRGBO(29, 29, 29, .4)),
              child: Image.asset("assets/assets/Archive.png", width: 24, height: 24,),
            ),
          ),
          Positioned(
            left: 21,
            top: 18,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color.fromRGBO(29, 29, 29, .4)),
              child:
                  GestureDetector(
                    onTap: () { Navigator.pop(context);},
                    child: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.white)),
            ),
          ),
          Positioned(
            left: 21,
            bottom: 29,
            child: Container(
              width: MediaQuery.of(context).size.width * .769,
              height: MediaQuery.of(context).size.height * .11,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(53, 63, 74, 1),
                    Color.fromRGBO(17, 43, 59, 1),
                    Color.fromRGBO(9, 48, 79, 1),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 22, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          lugar["nombre"],
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto"),
                        ),
                        Spacer(),
                        Text(
                          "price",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(202, 200, 200, 1),
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          lugar["ciudad"] + ", ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(202, 200, 200, 1),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto"),
                        ),
                        Text(
                          lugar["pais"],
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(202, 200, 200, 1),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto"),
                        ),
                        Spacer(),
                        Text(
                          "\$230",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(202, 200, 200, 1),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pmsn2025_2/Places/screens/place_screen.dart';

class ItemPlaceImage extends StatelessWidget {
  final Map<String, dynamic> lugar;

  const ItemPlaceImage({super.key, required this.lugar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceScreen(lugar: lugar),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .627,
        height: MediaQuery.of(context).size.height * .434,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              image: NetworkImage(lugar['imgUrl']), fit: BoxFit.cover),
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
                child: Icon(Icons.favorite_border_rounded, color: Colors.white),
              ),
            ),
            Positioned(
              left: 21,
              bottom: 29,
              child: Container(
                width: MediaQuery.of(context).size.width * .52,
                height: MediaQuery.of(context).size.height * .09,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(19, 51, 89, 1),
                      Color.fromRGBO(18, 50, 83, 1),
                      Color.fromRGBO(33, 75, 110, 1),
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
                            lugar["nombre"] + ", ",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Roboto"),
                          ),
                          Expanded(
                            child: Text(
                              lugar["ciudad"],
                              overflow: TextOverflow
                                  .ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(200, 200, 200, 1),
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(""),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color.fromRGBO(200, 200, 200, 1),
                            size: 16,
                          ),
                          Text(
                            lugar["pais"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(200, 200, 200, 1),
                                fontFamily: "Roboto"),
                          ),
                          Spacer(),
                          Icon(
                            Icons.star_border_outlined,
                            color: Color.fromRGBO(200, 200, 200, 1),
                            size: 12,
                          ),
                          Text(
                            lugar["calificacion"],
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(200, 200, 200, 1),
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
      ),
    );
  }
}
/*
child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(imgUrl,
        fit: BoxFit.cover),
      )
*/

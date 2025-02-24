import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025_2/Places/views/item_place_image.dart';

class ItemCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> lugares;

  const ItemCarousel({super.key, required this.lugares});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .434,
        viewportFraction: .7,
      ),
      //.map((lugar) => lugar["imgUrl"] as String).toList()
      items: lugares.map((item) => ItemPlaceImage(lugar: item)).toList(),
    );
  }
}

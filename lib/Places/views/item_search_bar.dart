import 'package:flutter/material.dart';

class ItemSearchBar extends StatelessWidget {
  const ItemSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontFamily: "Roboto"),
          hintText: "Search places",
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: Padding(
            padding:
                const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/assets/Line.png",
                  height: 32,
                ),
                const SizedBox(width: 10), // Espaciado entre imágenes
                Image.asset(
                  "assets/assets/icon_setting.png",
                  height: 32,
                ),
              ],
            ),
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        ),
      ),
    );
  }
}
/*
    SearchBar(
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0),
        ),
        backgroundColor: WidgetStateProperty<Color>.fromMap(
          <WidgetStatesConstraint, Color>{
            WidgetState.focused: const Color.fromARGB(255, 214, 214, 214),
            WidgetState.any: Colors.white,
          },
        ),
        trailing: [
          const Icon(Icons.tune_rounded, color: Colors.grey),
        ]);
*/

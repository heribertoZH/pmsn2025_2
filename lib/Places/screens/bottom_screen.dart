import 'package:flutter/material.dart';
import 'package:pmsn2025_2/Places/screens/home_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: [
        HomeScreen(),
        Center(
          child: Text('Index 2: Visitados', style: optionStyle),
        ),
        Center(
          child: Text('Index 3: Favoritos', style: optionStyle),
        ),
        Center(
          child: Text('Index 4: Perfil', style: optionStyle),
        ),
      ].elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavItem("assets/assets/icon_home.png", 0),
          _buildNavItem("assets/assets/icon_clock.png", 1),
          _buildNavItem("assets/assets/icon_heart.png", 2),
          _buildNavItem("assets/assets/icon_user.png", 3),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromRGBO(132, 130, 130, 1),
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String icon, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          Image.asset(
            icon,
            width: 23,
            height: 23,
            color: Color.fromRGBO(132, 130, 130, 1),
          ),
          if (isSelected)
            Positioned(
              bottom: 0,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      label: "",
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:practica_1/screens/home_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: [
        HomeScreen(),
        Center(
          child: Text('Index 2: Visitados', style: optionStyle),
        ), 
        Center(
          child: Text('Index 3: Favoritos', style: optionStyle),
        ),
        Center(
          child: Text('Index 4: Perfil', style: optionStyle),
        ),
      ].elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavItem(Icons.home_filled, 0),
          _buildNavItem(Icons.punch_clock_outlined, 1),
          _buildNavItem(Icons.favorite_border_rounded, 2),
          _buildNavItem(Icons.person_outline, 3),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromRGBO(132, 130, 130, 1),
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }


  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          Icon(icon,),
          if (isSelected)
            Positioned(
              bottom: 0,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      label: "",
    );
  }
}

*/
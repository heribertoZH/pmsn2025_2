import 'dart:io';
import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025_2/Places/screens/splash_screen.dart';
import 'package:pmsn2025_2/utils/global_values.dart';
import 'package:pmsn2025_2/utils/theme_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? _avatarPath;
  String? _font;
  String? _theme;
  String? _name;
  String? _email;
  bool? _actSesion;

  List<String> availableFonts = [
    "Roboto",
    "Inter",
    "Monserrat",
    "Poppins",
    "Lobster"
  ];

  List<String> availableThemes = ["Día", "Noche", "Cálido"];

  @override
  void initState() {
    super.initState();
    _loadSettings();
    _startSesion();
  }

  Future<void> _startSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(_actSesion == true){
      await prefs.setBool('sesion', true);
    } else {
      await prefs.remove('sesion');
    }
    
  }

  Future<void> _closeSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('sesion');
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _avatarPath = prefs.getString('avatar');
      _font = prefs.getString('font');
      _theme = prefs.getString('theme');
      _name = prefs.getString('name');
      _email = prefs.getString('email');
      _actSesion = prefs.getBool('actSesion') ?? false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenidos"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _showSettingsDialog,
          )
          /*DarlightButton(
            type: Darlights.DarlightFour,
            options: DarlightFourOption(),
            onChange: (value) {
              if (value == ThemeMode.light) {
                GlobalValues.themeApp.value = ThemeSettings.lightTheme();
              } else {
                GlobalValues.themeApp.value = ThemeData.dark();
              }
            },
          ),*/
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: _avatarPath != null &&
                        File(_avatarPath!).existsSync()
                    ? FileImage(File(_avatarPath!))
                    : AssetImage("assets/defaultAvatar.png") as ImageProvider,
              ),
              accountName: Text(
                _name!,
              ),
              accountEmail: Text(
                _email!,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                );
              },
              leading: Icon(Icons.design_services),
              title: Text(
                "Práctica Figma",
              ),
              subtitle: Text(
                "Frontend App",
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, "/todo"),
              leading: Icon(Icons.task),
              title: Text(
                "Todo App",
              ),
              subtitle: Text(
                "Task List",
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () async {
                await _closeSesion();
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login", (Route route) => false);
              },
              leading: Icon(Icons.task),
              title: Text(
                "Cerrar sesión",
              ),
              trailing: Icon(Icons.close),
            ),
          ],
        ),
      ),
      //endDrawer: Drawer(),
    );
  }

  Future<void> _updateSettingsFont(String font) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('font', font);
  }

  Future<void> _updateSettingTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }

  void _showSettingsDialog() {
  String? previewFont = _font;
  String? selectedTheme = _theme;

  // Determina el color del texto según el tema seleccionado
  Color textColor = (selectedTheme == "Día")
      ? Colors.black // Letras negras en tema claro
      : Colors.white; // Letras blancas en temas oscuros

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            backgroundColor: (selectedTheme == "Día")
                ? Colors.white
                : Color.fromARGB(199, 0, 0, 0),
            title: Text(
              "Configuración de Texto",
              style: TextStyle(fontSize: 20, color: textColor),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "A",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: previewFont,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "a",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: previewFont,
                        fontWeight: FontWeight.normal,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("Fuente", style: TextStyle(color: textColor)),
                DropdownButton<String>(
                  value: previewFont,
                  dropdownColor: (selectedTheme == "Día")
                      ? Colors.white
                      : Color.fromARGB(199, 0, 0, 0),
                  items: availableFonts.map((font) {
                    return DropdownMenuItem(
                      value: font,
                      child: Text(
                        font,
                        style: TextStyle(fontFamily: font, color: textColor),
                      ),
                    );
                  }).toList(),
                  onChanged: (newFont) {
                    setDialogState(() {
                      previewFont = newFont!;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text("Tema", style: TextStyle(color: textColor)),
                DropdownButton<String>(
                  value: selectedTheme,
                  dropdownColor: (selectedTheme == "Día")
                      ? Colors.white
                      : Color.fromARGB(199, 0, 0, 0),
                  items: availableThemes.map((theme) {
                    return DropdownMenuItem(
                      value: theme,
                      child: Text(
                        theme,
                        style: TextStyle(color: textColor),
                      ),
                    );
                  }).toList(),
                  onChanged: (newTheme) {
                    setDialogState(() {
                      selectedTheme = newTheme!;
                      textColor = (selectedTheme == "Día")
                          ? Colors.black
                          : Colors.white;
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancelar", style: TextStyle(color: textColor)),
              ),
              TextButton(
                onPressed: () async {
                  await _updateSettingsFont(previewFont!);
                  await _updateSettingTheme(selectedTheme!);
                  setState(() {
                    _font = previewFont;
                    _theme = selectedTheme;
                  });

                  // Aplicar el nuevo tema globalmente
                  GlobalValues.font.value = previewFont!;
                  if (selectedTheme == 'Día') {
                    GlobalValues.themeApp.value = ThemeSettings.lightTheme();
                  } else if (selectedTheme == 'Noche') {
                    GlobalValues.themeApp.value = ThemeSettings.darkTheme();
                  } else {
                    GlobalValues.themeApp.value = ThemeSettings.warmTheme();
                  }
                  
                  Navigator.pop(context);
                },
                child: Text("Guardar", style: TextStyle(color: textColor)),
              ),
            ],
          );
        },
      );
    },
  );
}

}

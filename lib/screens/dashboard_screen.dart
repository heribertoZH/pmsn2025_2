import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025_2/Places/screens/splash_screen.dart';
import 'package:pmsn2025_2/utils/global_values.dart';
import 'package:pmsn2025_2/utils/theme_settings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenidos"),
        actions: [
          DarlightButton(
              type: Darlights.DarlightFour,
              options: DarlightFourOption(),
              onChange: (value) {
                if (value == ThemeMode.light) {
                  GlobalValues.themeApp.value = ThemeSettings.lightTheme();
                } else {
                  GlobalValues.themeApp.value = ThemeData.dark();
                }
              }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/41008/cowboy-ronald-reagan-cowboy-hat-hat-41008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
              accountName: Text("Heriberto Zuñiga Hernandez"),
              accountEmail: Text("Heriberto@itcelaya.edu.com"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.design_services),
                title: Text("Práctica Figma"),
                subtitle: Text("Frontend App"),
                trailing: Icon(Icons.chevron_right),
              ),
            )
          ],
        ),
      ),
      //endDrawer: Drawer(),
    );
  }
}

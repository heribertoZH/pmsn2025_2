import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025_2/screens/dashboard_screen.dart';
import 'package:pmsn2025_2/screens/list_students_screen.dart';
import 'package:pmsn2025_2/utils/global_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _actSesion = false;

  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _actSesion = prefs.getBool('actSesion') ?? false;
    });
  }

  bool isValidating = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (_emailController.text == savedEmail &&
        _passwordController.text == savedPassword) {
      setState(() {
        _errorMessage = "";
      });
      Navigator.pushNamedAndRemoveUntil(
          context, "/dash", (Route route) => false);
    } else {
      setState(() {
        _errorMessage = "Credenciales incorrectas";
      });
    }
  }

  Future<void> _updateSettingActSesion(bool actSesion) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (actSesion == true) {
      await prefs.setBool('actSesion', actSesion);
    } else {
      await prefs.remove('actSesion');
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtUser = TextFormField(
      controller: _emailController,
      decoration: InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      validator: (value) => value!.isEmpty ? "Ingresa tu email" : null,
    );

    final txtPass = TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(labelText: "Contraseña"),
      obscureText: true,
      validator: (value) => value!.isEmpty ? "Ingresa tu contraseña" : null,
    );

    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen difuminada
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.5,
                fit: BoxFit.cover,
                image: AssetImage("assets/fondo.jpg"),
              ),
            ),
          ),

          // Contenido principal
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),

                // Animación
                Lottie.asset("assets/tecnm.json", height: 200),

                SizedBox(height: 20),

                // Formulario de inicio de sesión
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (_errorMessage != null) ...[
                          Text(_errorMessage!,
                              style: TextStyle(color: Colors.red)),
                          SizedBox(height: 10),
                        ],

                        _buildTextField(
                          controller: _emailController,
                          label: "Email",
                          icon: Icons.person,
                          validator: (value) =>
                              value!.isEmpty ? "Ingrese su email" : null,
                        ),
                        SizedBox(height: 10),
                        _buildTextField(
                          controller: _passwordController,
                          label: "Contraseña",
                          icon: Icons.lock,
                          obscureText: true,
                          validator: (value) => value!.length < 6
                              ? "Debe tener al menos 6 caracteres"
                              : null,
                        ),
                        SizedBox(height: 10),
                        SwitchListTile(
                          value: _actSesion,
                          title: Text("Mantener sesión"),
                          onChanged: (value) async {
                            setState(() {
                              _actSesion = value;
                            });
                            await _updateSettingActSesion(value);
                          },
                        ),
                        SizedBox(height: 20),

                        // Botón de login o carga
                        isValidating
                            ? CircularProgressIndicator()
                            : SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: _login,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  child: Text("Iniciar Sesión",
                                      style: TextStyle(fontSize: 16)),
                                ),
                              ),

                        SizedBox(height: 15),

                        // Botón de registro
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _errorMessage = "";
                            });
                            Navigator.pushNamed(context, "/register");
                          },
                          child: Text(
                            "¿No tienes cuenta? Regístrate",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

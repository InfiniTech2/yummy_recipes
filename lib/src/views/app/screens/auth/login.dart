import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  Future<void> loginUser(String email, String password) async {
    const String baseUrl = 'http://192.168.0.22:8001';
    final Uri loginUrl = Uri.parse('$baseUrl/usuario-login');

    final Map<String, String> body = {'email': email, 'senha': password};

    try {
      final response = await http.post(
        loginUrl,
        headers: {
          'Content-Type': 'application/json'
        }, // Add content type header
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/home');
        print('Login successful!');
      } else {
        print('Login falhou! Código de status: ${response.statusCode}');
      }
    } on Exception catch (e) {
      print('Erro durante o login: $e');
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFCDEBC),
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/yummy_logo.jpg'),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                top: 329,
                left: 40,
                right: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: SizedBox(
                    width: 348,
                    height: 18,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 158, 157, 157),
                        ),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address.';
                        }

                        if (!RegExp(r'^[\w-\.]+@[\w-\.]+\.[a-zA-Z]+$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address.';
                        }
                        return null; // Validation successful
                      },
                      controller: _emailController,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 390,
                left: 40,
                right: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: SizedBox(
                    width: 348,
                    height: 18,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 158, 157, 157),
                        ),
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              });
                            },
                          ),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password.';
                        }

                        return null; // Validation successful
                      },
                      obscureText: !_passwordVisible,
                      controller: _senhaController,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 449,
                left: 40,
                right: 40,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _senhaController.text;
                      loginUser(email, password);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      backgroundColor: const Color(0xFF4CA20A),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7.0, horizontal: 20.0),
                    ),
                    child: const SizedBox(
                      width: 348,
                      height: 28,
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 500,
                left: 40,
                right: 40,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reset');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      backgroundColor: const Color(0xFF4CA20A),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7.0, horizontal: 20.0),
                    ),
                    child: const SizedBox(
                      width: 348,
                      height: 28,
                      child: Text(
                        'Resetar Senha',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 220, 219, 219)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 549,
                left: 40,
                right: 40,
                child: Center(
                  child: Divider(
                    color: Color(0xFF4CA20A),
                    thickness: 1,
                  ),
                ),
              ),
              Positioned(
                top: 565,
                left: 40,
                right: 40,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cadastro');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      backgroundColor: const Color(0xFF4CA20A),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7.0, horizontal: 20.0),
                    ),
                    child: const SizedBox(
                      width: 348,
                      height: 28,
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

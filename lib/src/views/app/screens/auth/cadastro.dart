import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cadastro extends StatefulWidget {
  Cadastro({Key? key}) : super(key: key);

  @override
  CadastroState createState() => CadastroState();
}

class CadastroState extends State<Cadastro> {
  bool _passwordVisible = false;
  bool checkbox = false;
  bool acceptedTerms = false;

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  Future<void> cadastroUser(
    String nome,
    String email,
    String senha,
  ) async {
    const String baseUrl = 'http://177.31.18.201:8001';
    final Uri loginUrl = Uri.parse('$baseUrl/usuario');

    final Map<String, String> body = {
      'nome': nome,
      "email": email,
      "senha": senha,
    };

    try {
      final response = await http.post(
        loginUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/home');
        print('Cadastro successful!');
      } else {
        print('Cadastro falhou! Código de status: ${response.statusCode}');
      }
    } on Exception catch (e) {
      print('Erro durante o Cadastro: $e');
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
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                child: Container(
                  width: 262,
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/yummy_logo.jpg'))),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: SizedBox(
                  width: 330,
                  height: 18,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 158, 157, 157),
                      ),
                      border: InputBorder.none,
                    ),
                    controller: _nomeController,
                    style: const TextStyle(fontSize: 16),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha seu nome';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: SizedBox(
                  width: 330,
                  height: 18,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 158, 157, 157),
                      ),
                      border: InputBorder.none,
                    ),
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha seu e-mail';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: SizedBox(
                  width: 330,
                  height: 18,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 158, 157, 157),
                      ),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(fontSize: 16),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha o nome';
                      }
                      return null;
                    },
                    obscureText: !_passwordVisible,
                    controller: _senhaController,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final nome = _nomeController.text;
                    final email = _emailController.text;
                    final senha = _senhaController.text;
                    cadastroUser(nome, email, senha);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    backgroundColor: const Color(0xFF4CA20A),
                    padding: const EdgeInsets.symmetric(
                      vertical: 7.0,
                      horizontal: 3.0,
                    ),
                  ),
                  child: const SizedBox(
                    width: 348,
                    height: 28,
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    backgroundColor: const Color(0xFF4CA20A),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 3.0,
                    ),
                  ),
                  child: const SizedBox(
                    width: 348,
                    height: 28,
                    child: Text(
                      'Já tenho cadastro',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

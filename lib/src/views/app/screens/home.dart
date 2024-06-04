import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemplo de lista de receitas
    final List<String> receitas = [
      "Receita Bolo",
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFCDEBC),
        body: Stack(
          children: [
            Positioned(
              bottom: 700.0,
              left: 41.0,
              right: 41.0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/newRecipe');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: const Color(0xFF4CA20A),
                      fixedSize: const Size(348, 78)),
                  child: const Text(
                    'Criar Receita',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 500.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/yummy_logo.jpg'),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: const SizedBox(
                  width: double.infinity, // ou ajuste para o tamanho desejado
                  height: 200.0, // ajuste conforme necessário
                ),
              ),
            ),
            Positioned(
              bottom: 350.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFCFCFA),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Receitas Cadastradas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ...receitas.map((receita) => Text(
                          receita,
                          style: const TextStyle(fontSize: 16),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

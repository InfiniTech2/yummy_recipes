import 'package:flutter/material.dart';

class Initial extends StatelessWidget {
  const Initial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFCDEBC),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/yummy_logo.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Positioned(
              top: 650.0,
              left: 50.0,
              right: 50.0,
              child: Text(
                'O seu caderno de receita digital',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              bottom: 100.0,
              left: 0.0,
              right: 160.0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    backgroundColor: const Color(0xFF4CA20A),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 50.0,
                    ),
                    shadowColor: const Color(0xFFED996A), // Cor da sombra
                    elevation: 10.0,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100.0,
              left: 170.0,
              right: 0.0,
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
                        vertical: 10.0, horizontal: 40.0),
                    shadowColor: const Color(0xFFED996A), // Cor da sombra
                    elevation: 10.0, // Intensidade da sombra
                  ),
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
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

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo cobrindo toda a tela
          Positioned.fill(
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/4/4e/OurLadyGenazzano02.jpg", // Substitua pelo caminho correto
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Salve Maria!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black54, blurRadius: 8.0),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    backgroundColor: Colors.white.withOpacity(0.8),
                    shadowColor: Colors.black54,
                    elevation: 10,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/escalacao_screen");
                  },
                  child: const Text(
                    "Terciários escalados",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 15),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    backgroundColor: Colors.white.withOpacity(0.8),
                    shadowColor: Colors.black54,
                    elevation: 10,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/terciarios_screen"); // Nova rota
                  },
                  child: const Text(
                    "Terciários disponíveis",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
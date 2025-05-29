
import 'package:flutter/material.dart';
import 'home_image_screen.dart';
import 'package:meu_app/screens/escalacao_screen.dart' as escalacao;
import 'package:meu_app/screens/terciarios_screen.dart' as terciarios;
import 'package:meu_app/screens/atividade_screen.dart' as atividades;
import 'package:meu_app/screens/confissao_screen.dart' as confissao;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Define a aba inicial (0 = Home)

  bool isConfissaoEnabled = false; // Mude para `true` para ativar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza a aba selecionada
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
    const HomeImageScreen(),
      if (isConfissaoEnabled) const confissao.HomeScreen(),
    const escalacao.HomeScreen(),
    const terciarios.HomeScreen(),
    const atividades.HomeScreen(),
    ];
    return Scaffold(
      body: screens[_selectedIndex], // Exibe a tela correspondente

      // TabBar fixa na parte inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 10,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          if (isConfissaoEnabled)
            const BottomNavigationBarItem(icon: Icon(Icons.church), label: "Confissão"),
          const BottomNavigationBarItem(icon: Icon(Icons.people), label: "Escalados"),
          const BottomNavigationBarItem(icon: Icon(Icons.group), label: "Terciários"),
          const BottomNavigationBarItem(icon: Icon(Icons.handyman), label: "Atividades"),
        ],
      ),
    );
  }
}

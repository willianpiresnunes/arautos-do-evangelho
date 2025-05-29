import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget  {
  const HomeScreen({super.key});

  @override
  AtividadeScreenState createState() => AtividadeScreenState();
}

class AtividadeScreenState extends State<HomeScreen> {
  final List<String> atividades = [
    "Adoração ao Santíssimo",
    "Colocar as cadeiras",
    "Retirar as cadeiras",
    "Patena",
    "Acolhida",
    "Lanche",
    "Imagem e som",
  ];
  final TextEditingController _controller = TextEditingController();

  void adicionarAtividade() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        atividades.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Atividades a Realizar")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: atividades.length,
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      atividades[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(Icons.check_circle_outline, color: Colors.green),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Nova Atividade",
                      prefixIcon: const Icon(Icons.edit, color: Colors.blue),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                  ),
                  onPressed: adicionarAtividade,
                  child: const Text(
                    "Adicionar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
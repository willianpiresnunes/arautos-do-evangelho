import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  ConfissaoScreenState createState() => ConfissaoScreenState();
}

class ConfissaoScreenState extends State<HomeScreen> {
  final List<DateTime> confissoes = []; // Lista de datas de confissão

  void _adicionarConfissao() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        confissoes.add(selectedDate);
      });
    }
  }

  int _calcularDiasDesdeUltimaConfissao() {
    if (confissoes.isEmpty) return 0;
    DateTime ultimaConfissao = confissoes.last;
    return DateTime.now().difference(ultimaConfissao).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confissões")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _adicionarConfissao,
              child: const Text("Adicionar Nova Confissão"),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Dias desde a última confissão: ${_calcularDiasDesdeUltimaConfissao()}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: confissoes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(DateFormat("dd/MM/yyyy").format(confissoes[index])),
                  leading: const Icon(Icons.church, color: Colors.brown),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

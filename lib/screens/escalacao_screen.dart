import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:meu_app/screens/selection_provider.dart';
import 'package:provider/provider.dart';
import '../models/person.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectionProvider = Provider.of<SelectionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Selecionados")),
      body: selectionProvider.selectedPeople.isEmpty
          ? const Center(child: Text("Nenhum terciário selecionado"))
          : ListView.builder(
        itemCount: selectionProvider.selectedPeople.length,
        itemBuilder: (context, index) {
          final person = selectionProvider.selectedPeople[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(person.imageUrl)),
            title: Text(person.name),
            subtitle: Text(person.description),
          );
        },
      ),
    );
  }
}
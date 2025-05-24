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

    final List<Person> people = [
      Person(name: "Santa Teresinha", imageUrl: "https://bibliotecacatolica.com.br/wp-content/uploads/2023/10/a-vida-de-santa-teresinha-thumb-scaled.jpg", description: "Sta Teresinha"),
      Person(name: "Santa Gema", imageUrl: "https://th.bing.com/th/id/OIP.uolV9mSM2bHUQWgF6eY_jQHaFj?w=237&h=180&c=7&r=0&o=5&cb=iwc2&pid=1.7", description: "Sta Gema"),
      Person(name: "Mons Joao", imageUrl: "https://s3.amazonaws.com/ahe.images/1/Mons-Joao-Cla-4.jpg", description: "Mons João"),
      Person(name: "Sr Willian", imageUrl: "https://media.licdn.com/dms/image/v2/D4D03AQFtyWF6KdNzYA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1727450786865?e=1753315200&v=beta&t=IOjHmDHnIiRfU4CPzseL6XKK5shYIhjgffiZFFPTQ64", description: "Sr. Willian"),
      Person(name: "Sra Sabrina", imageUrl: "https://media.licdn.com/dms/image/v2/D4D03AQEkalr6TugFQw/profile-displayphoto-shrink_200_200/B4DZTSZ0OPGcAY-/0/1738696772535?e=1753315200&v=beta&t=jMThuTuROZGJK3EFWT30WDdOWcSqmec0a8OP4NOH0-k", description: "Sra. Sabrina"),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Selecionar Terciários")),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          final isSelected = selectionProvider.selectedPeople.any((p) => p.name == person.name);

          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(person.imageUrl)),
            title: Text(person.name),
            subtitle: Text(person.description),
            trailing: Icon(
              Icons.circle,
              color: isSelected ? Colors.grey : Colors.green, // Verde disponível, cinza se já escalado
            ),
            onTap: () {
              if (isSelected) {
                _showAlert(context); // Exibir alerta ao tentar selecionar novamente
              } else {
                selectionProvider.selectPerson(person);
              }
            },
          );
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Atenção"),
        content: const Text("Terciário já está escalado em uma função."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}

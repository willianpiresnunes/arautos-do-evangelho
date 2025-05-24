import 'package:flutter/material.dart';

import '../models/person.dart';

class SelectionProvider extends ChangeNotifier {
  final List<Person> selectedPeople = []; // Armazena os selecionados

  void selectPerson(Person person) {
    if (!selectedPeople.contains(person)) {
      selectedPeople.add(person);
      notifyListeners(); // Atualiza a interface
    }
  }
}

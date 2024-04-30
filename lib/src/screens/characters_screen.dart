import 'package:flutter/material.dart';
import 'package:flutter_sample_app/src/models/repositories/characters_repository.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
    fetchCharacters(1);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

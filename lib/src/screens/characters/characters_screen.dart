import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_app/src/models/repositories/characters_repository.dart';
import 'package:flutter_sample_app/src/screens/characters/bloc/characters_bloc.dart';
import 'package:flutter_sample_app/src/screens/characters/characters_list.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RepositoryProvider(
            create: (context) => CharactersRepository(),
            child: BlocProvider(
              create: (context) => CharactersBloc(
                  charactersRepository: context.read<CharactersRepository>()),
              child: const CharactersList(),
            )));
  }
}

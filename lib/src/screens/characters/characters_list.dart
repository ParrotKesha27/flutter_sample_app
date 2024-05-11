import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_app/src/screens/characters/bloc/characters_bloc.dart';
import 'package:flutter_sample_app/src/screens/characters/character_list_item.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_loadMore);
    context.read<CharactersBloc>().add(CharactersRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
      switch (state.status) {
        case CharactersStatus.init:
          return const SizedBox.shrink();
        case CharactersStatus.emptyError:
          return const Center(child: Text("Failed to fetch characters"));
        case CharactersStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case CharactersStatus.empty:
          return const Center(child: Text("No characters received"));
        case CharactersStatus.data:
        case CharactersStatus.loadNextPage:
        case CharactersStatus.loadNextPageError:
          return ListView.builder(
              itemCount: state.characters.length,
              controller: _controller,
              itemBuilder: (context, index) {
                return CharacterListItem(character: state.characters[index]);
              });
      }
    });
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_loadMore)
      ..dispose();
    super.dispose();
  }

  void _loadMore() {
    if (_isBottom) {
      context.read<CharactersBloc>().add(CharactersRequested());
    }
  }

  bool get _isBottom {
    if (!_controller.hasClients) {
      return false;
    }

    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

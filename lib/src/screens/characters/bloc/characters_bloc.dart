import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_app/src/models/entities/character.dart';
import 'package:flutter_sample_app/src/models/repositories/characters_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({required this.charactersRepository})
      : super(const CharactersState()) {
    on<CharactersRequested>(_onCharactersRequested);
  }

  final CharactersRepository charactersRepository;

  Future<void> _onCharactersRequested(
      CharactersRequested event, Emitter<CharactersState> emit) async {
    if (state.hasReachedMax) {
      return;
    }

    try {
      if (state.status == CharactersStatus.loading ||
          state.status == CharactersStatus.loadNextPage) {
        return;
      }

      if (state.hasReachedMax) {
        return;
      }

      emit(state.characters.isEmpty
          ? state.copyWith(status: CharactersStatus.loading)
          : state.copyWith(status: CharactersStatus.loadNextPage));

      final characters = await charactersRepository.fetchCharacters(
          page: state.currentPage + 1);

      var newStatus =
          characters.results.isEmpty && state.status == CharactersStatus.loading
              ? CharactersStatus.empty
              : CharactersStatus.data;
      var hasReachedMax = characters.info.next == null ||
          newStatus == CharactersStatus.data && characters.results.isEmpty;
      var newState = state.copyWith(
        status: newStatus,
        hasReachedMax: hasReachedMax,
        characters: List.of(state.characters)..addAll(characters.results),
        currentPage: state.currentPage + 1,
      );
      emit(newState);
    } catch (_) {
      var errorStatus = state.characters.isEmpty
          ? CharactersStatus.emptyError
          : CharactersStatus.loadNextPageError;
      emit(state.copyWith(status: errorStatus));
    }
  }
}

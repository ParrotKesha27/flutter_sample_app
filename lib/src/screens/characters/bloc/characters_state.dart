part of 'characters_bloc.dart';

/*
         empty <----------------------------------------------------------
          / \                                                            |
           |                                                             |
           |                                                             |
          \ /                                                            |
init --> loading ----------------------> data <----------------------> refresh
             /\                          /\ /\______                     |
              \                           \         \________            |
               \                           \                 \______     |
               \/                          \/                       \   \ /
            emptyError                loadNextPage                 refreshError
                                           / \
                                            |
                                            |
                                           \ /
                                      loadNextPageError
*/

enum CharactersStatus {
  init,
  loading,
  data,
  empty,
  emptyError,
  loadNextPage,
  loadNextPageError,
}

final class CharactersState extends Equatable {
  final CharactersStatus status;
  final List<Character> characters;
  final int currentPage;
  final bool hasReachedMax;

  const CharactersState(
      {this.status = CharactersStatus.init,
      this.characters = const <Character>[],
      this.currentPage = 0,
      this.hasReachedMax = false});

  CharactersState copyWith({
    CharactersStatus? status,
    List<Character>? characters,
    int? currentPage,
    bool? hasReachedMax,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, characters, hasReachedMax];
}

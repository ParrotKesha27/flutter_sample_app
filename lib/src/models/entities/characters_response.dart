import 'package:flutter_sample_app/src/models/entities/character.dart';

class CharactersResponse {
  final Info info;
  final List<Character> results;

  const CharactersResponse({required this.info, required this.results});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'info': Map<String, dynamic> info,
        'results': List<dynamic> results
      } =>
        CharactersResponse(
            info: Info.fromJson(info),
            results: results.map((e) => Character.fromJson(e)).toList()),
      _ => throw FormatException('Failed to parse CharactersResponse', json)
    };
  }
}

class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const Info({required this.count, required this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'count': int count,
        'pages': int pages,
        'next': String? next,
        'prev': String? prev,
      } =>
        Info(count: count, pages: pages, next: next, prev: prev),
      _ => throw FormatException('Failed to parse Info', json),
    };
  }
}

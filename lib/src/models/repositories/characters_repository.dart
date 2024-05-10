import 'dart:convert';
import 'dart:io';

import 'package:format/format.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_sample_app/src/models/entities/characters_response.dart';

class CharactersRepository {
  final String _baseCharactersUri =
    "https://rickandmortyapi.com/api/character/?page={}";

  Future<CharactersResponse> fetchCharacters({int page = 1}) async {
    final uri = Uri.parse(format(_baseCharactersUri, page));
    final response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      final result = CharactersResponse.fromJson(jsonDecode(response.body));
      return result;
    } else {
      throw Exception('Failed to fetch characters');
    }
  }
}

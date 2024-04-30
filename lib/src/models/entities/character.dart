class Character {
  final int id;
  final String name;
  final Status status;
  final String species;
  final String type;
  final Gender gender;
  final LocationLink origin;
  final LocationLink location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  const Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});

  factory Character.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'status': String status,
        'species': String species,
        'type': String type,
        'gender': String gender,
        'origin': Map<String, dynamic> origin,
        'location': Map<String, dynamic> location,
        'image': String image,
        'episode': List<dynamic> episode,
        'url': String url,
        'created': String created,
      } =>
        Character(
            id: id,
            name: name,
            status: Status.values.byName(status.toLowerCase()),
            species: species,
            type: type,
            gender: Gender.values.byName(gender.toLowerCase()),
            origin: LocationLink.fromJson(origin),
            location: LocationLink.fromJson(location),
            image: image,
            episode: episode.map((e) => e as String).toList(),
            url: url,
            created: created),
      _ => throw FormatException('Failed to parse Character', json),
    };
  }
}

enum Status { alive, dead, unknown }

enum Gender { female, male, genderless, unknown }

class LocationLink {
  final String name;
  final String url;

  const LocationLink({
    required this.name,
    required this.url,
  });

  factory LocationLink.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'url': String url,
      } =>
        LocationLink(name: name, url: url),
      _ => throw FormatException('Failed to parse LocationLink', json),
    };
  }
}

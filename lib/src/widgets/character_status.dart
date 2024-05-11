import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/src/models/entities/character.dart';

class CharacterStatus extends StatelessWidget {
  const CharacterStatus({required this.characterStatus, super.key});

  final Status characterStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _statusToColor(),
      ),
    );
  }

  Color _statusToColor() {
    return switch (characterStatus) {
      Status.alive => const Color(0xFF55CC44),
      Status.dead => const Color(0xFFD63D2E),
      Status.unknown => const Color(0xFF9E9E9E),
    };
  }
}

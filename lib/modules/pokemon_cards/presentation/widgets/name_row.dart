import 'package:flutter/material.dart';
import 'package:pokedex_v2/global/constants/app_color.dart';
import 'package:pokedex_v2/global/constants/app_icon.dart';
import 'package:pokedex_v2/global/constants/spacing.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';

class NameRow extends StatelessWidget {
  const NameRow({
    super.key,
    required this.pokemone,
  });

  final PokemonEntity pokemone;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          pokemone.name ?? '',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500),
        ),
        const HorizontalSpacing(15),
        CircleAvatar(
          radius: 12,
          backgroundColor: kSilverTree,
          child: Image.asset(
            kLeaf,
            color: kPlantation,
            height: 12,
            width: 12,
          ),
        ),
        const HorizontalSpacing(20),
        CircleAvatar(
          radius: 12,
          backgroundColor: kDullLavender,
          child: Image.asset(
            kAlien,
            color: kMartinique,
            height: 16,
            width: 16,
          ),
        )
      ],
    );
  }
}
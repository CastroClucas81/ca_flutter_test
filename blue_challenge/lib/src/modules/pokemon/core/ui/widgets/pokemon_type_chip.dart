import 'package:blue_challenge/src/core/colors/pokedex_colors.dart';
import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_type_entity.dart';
import 'package:flutter/material.dart';

class PokemonTypeChip extends StatelessWidget {
  final PokemonTypeEntity type;
  final bool isDense;

  const PokemonTypeChip({
    required this.type,
    this.isDense = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDense ? 10 : 25,
        vertical: 4,
      ),
      constraints: const BoxConstraints(
        minWidth: 60,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // color: DSColors.red,
        color: PokedexColors.getByName(type.name),
      ),
      child: Text(
        type.name,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: DSColors.white,
          fontWeight: FontWeight.w500,
          fontSize: isDense ? 14 : 20,
        ),
      ),
    );
  }
}

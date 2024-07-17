import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/colors/pokedex_colors.dart';
import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/core/utils/extensions/string_extension.dart';
import 'package:blue_challenge/src/core/utils/utils.dart';
import 'package:blue_challenge/src/core/widgets/remote_image.dart';
import 'package:flutter/material.dart';

class PokemonEvolutionCard extends StatelessWidget {
  final String id;
  final String firstType;
  final int? evolutionLevel;
  final String? trigger;
  final String name;
  final bool isFirst;

  const PokemonEvolutionCard({
    required this.id,
    required this.firstType,
    this.evolutionLevel,
    this.trigger,
    required this.name,
    required this.isFirst,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        if (!isFirst)
          Text(
            evolutionLevel == null
                ? trigger ?? S.of(context).undefined
                : S.of(context).levelX(evolutionLevel.toString()),
            style: const TextStyle(
              color: DSColors.blue,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: CircleAvatar(
                  backgroundColor: PokedexColors.getByName(firstType),
                  child: RemoteImage(
                    url: Utils.handlePokemonGif(id: id),
                    height: 60,
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.capitalizeFirstLetter(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      S.of(context).nX(id),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

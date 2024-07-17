import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/colors/pokedex_colors.dart';
import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/core/utils/extensions/string_extension.dart';
import 'package:blue_challenge/src/core/utils/utils.dart';
import 'package:blue_challenge/src/core/widgets/remote_image.dart';
import 'package:blue_challenge/src/modules/pokemon/core/ui/widgets/pokemon_type_chip.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolution_chain_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_to_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_details_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/ui/widgets/detail_title.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/ui/widgets/pokemon_detail_card.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/ui/widgets/pokemon_evolution_card.dart';
import 'package:flutter/material.dart';

class PokemonDetailsData extends StatelessWidget {
  final PokemonDetailsEntity pokemon;
  final EvolutionChainEntity evolutionChain;

  const PokemonDetailsData({
    required this.pokemon,
    required this.evolutionChain,
    super.key,
  });

  List<EvolvesToEntity> _groupEvolvesTo(List<EvolvesToEntity> evolvesToList) {
    List<EvolvesToEntity> allEvolvesTo = [];

    for (final evolution in evolvesToList) {
      allEvolvesTo.add(evolution);

      if (evolution.evolvesTo.isNotEmpty) {
        allEvolvesTo.addAll(_groupEvolvesTo(evolution.evolvesTo));
      }
    }

    return allEvolvesTo;
  }

  @override
  Widget build(BuildContext context) {
    final evolutions = [
      EvolvesToEntity(
        species: evolutionChain.species,
        evolvesTo: const [],
      ),
      ..._groupEvolvesTo(evolutionChain.evolvesTo)
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: PokedexColors.getByName(pokemon.types.first.name),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.elliptical(140, 50),
                bottomRight: Radius.elliptical(140, 50),
              ),
            ),
            child: Center(
              child: RemoteImage(
                url: pokemon.gif,
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name.capitalizeFirstLetter(),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  S.of(context).nX(pokemon.id),
                  style: const TextStyle(fontSize: 22),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: List.generate(
                      pokemon.types.length,
                      (index) {
                        return PokemonTypeChip(
                          isDense: false,
                          type: pokemon.types[index],
                        );
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PokemonDetailCard(
                        title: S.of(context).weight,
                        titleIcon: Icons.line_weight_rounded,
                        content: '${(pokemon.weight * 0.1).roundToDouble()} kg',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: PokemonDetailCard(
                        title: S.of(context).height,
                        titleIcon: Icons.height_rounded,
                        content: '${pokemon.height / 10} m',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PokemonDetailCard(
                        title: S.of(context).ability,
                        titleIcon: Icons.catching_pokemon,
                        content: pokemon.name.capitalizeFirstLetter(),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                const SizedBox(height: 20),
                DetailTitle(title: S.of(context).stats),
                Column(
                  children: List.generate(
                    pokemon.stats.length,
                    (index) {
                      final stat = pokemon.stats[index];
                      final baseState = stat.baseStat * 0.01;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stat.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          TweenAnimationBuilder(
                            tween: Tween(end: baseState),
                            duration: const Duration(seconds: 1),
                            builder: (context, value, child) {
                              return LinearProgressIndicator(
                                minHeight: 6,
                                value: value,
                                backgroundColor: DSColors.red.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  DSColors.blue,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 12)
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                if (evolutions.isNotEmpty) ...[
                  DetailTitle(title: S.of(context).evolutions),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: List.generate(
                        evolutions.length,
                        (index) {
                          final evolution = evolutions[index];

                          final evolutionId = Utils.extractIdFromUrl(
                            evolution.species.url,
                          );

                          return PokemonEvolutionCard(
                            isFirst: index == 0,
                            id: evolutionId,
                            firstType: pokemon.types.first.name,
                            evolutionLevel: evolution.minLevel,
                            name: evolution.species.name,
                            trigger: evolution.trigger,
                          );
                        },
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

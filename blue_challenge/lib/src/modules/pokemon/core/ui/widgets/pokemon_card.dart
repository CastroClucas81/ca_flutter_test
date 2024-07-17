import 'package:asp/asp.dart';
import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/core/utils/utils.dart';
import 'package:blue_challenge/src/core/widgets/remote_image.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/atoms/pokemon_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/insert_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/dtos/remove_local_pokemon_dto.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final VoidCallback onPressed;

  const PokemonCard({
    required this.pokemon,
    required this.onPressed,
    super.key,
  });

  String get _id => Utils.extractIdFromUrl(pokemon.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: DSColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).nX(_id),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          pokemon.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RemoteImage(
                    url: Utils.handlePokemonGif(id: _id),
                    height: 100,
                    width: 100,
                    progressColor: DSColors.blue,
                  ),
                ],
              ),
              RxBuilder(
                builder: (context) {
                  final favoritePokemons = favoritePokemonsState.value;
                  final isFavorited =
                      favoritePokemons.any((e) => e.name == pokemon.name);

                  return Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      onPressed: () {
                        if (isFavorited) {
                          unfavoritePokemonAction.setValue(
                            RemoveLocalPokemonDTO(name: pokemon.name),
                          );
                        } else {
                          favoritePokemonAction.setValue(
                            InsertLocalPokemonDTO(
                              name: pokemon.name,
                              url: pokemon.url,
                            ),
                          );
                        }
                      },
                      icon: CircleAvatar(
                        backgroundColor: DSColors.black.withOpacity(0.4),
                        child: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_outline,
                          color: isFavorited ? DSColors.red : DSColors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

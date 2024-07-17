import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/design_system/assets/images/ds_image_enum.dart';
import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/core/design_system/widgets/buttons/ds_button.dart';
import 'package:blue_challenge/src/modules/authentication/interactor/atoms/authentication_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/core/interactor/atoms/pokemon_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/atoms/pokemons_atom.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/states/pokemons_state.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/ui/widgets/tabs/favorite_pokemons_tab.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/ui/widgets/tabs/pokemons_tab.dart';
import 'package:flutter/material.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  final selectedPageNotifier = ValueNotifier<int>(0);
  final pageController = PageController();

  @override
  void initState() {
    getFavoritePokemonsAction();

    if (!pokemonsState.value.pagingIsStarted) {
      pokemonsState.value.pagingController.addPageRequestListener((pageKey) {
        final dto = pokemonsState.value.dto.copyWith(offset: pageKey * 20);

        pokemonsState.setValue(PokemonsState(
          dto: dto,
          pagingController: pokemonsState.value.pagingController,
          pagingIsStarted: true,
        ));
      });
    }

    super.initState();
  }

  void showLogoutDialog() {
    final alert = AlertDialog(
      title: Text(S.of(context).attention),
      content: Text(S.of(context).confirmYoutLogout),
      actions: [
        DSButton(
          icon: Icons.logout,
          title: S.of(context).logout,
          onPressed: () {
            Navigator.pop(context);
            logoutAction();
          },
        )
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DSColors.darkBlue,
        centerTitle: true,
        title: Image.asset(
          DSImageEnum.pokedex.path,
          fit: BoxFit.cover,
          height: 45,
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: DSColors.white,
          boxShadow: [
            BoxShadow(
              color: DSColors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ValueListenableBuilder(
            valueListenable: selectedPageNotifier,
            builder: (context, selectedPage, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      pageController.jumpToPage(0);
                    },
                    color: selectedPage == 0 ? DSColors.red : DSColors.darkBlue,
                    icon: const Icon(Icons.home),
                  ),
                  IconButton(
                    onPressed: () {
                      pageController.jumpToPage(1);
                    },
                    color: selectedPage == 1 ? DSColors.red : DSColors.darkBlue,
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: showLogoutDialog,
                    color: DSColors.darkBlue,
                    icon: const Icon(Icons.logout),
                  )
                ],
              );
            }),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          selectedPageNotifier.value = value;
        },
        children: const [
          PokemonsTab(),
          FavoritePokemonsTab(),
          SizedBox(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    selectedPageNotifier.dispose();
    pageController.dispose();
    super.dispose();
  }
}

import 'package:blue_challenge/src/modules/pokemon/core/interactor/entities/pokemon_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolution_chain_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/evolves_specie_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/details/interactor/entities/pokemon_details_entity.dart';
import 'package:blue_challenge/src/modules/pokemon/modules/pokemons/interactor/entites/paginate_pokemon_entity.dart';

const tMockPokemonEntity = PokemonEntity(name: 'name', url: 'url');

const tMockPokemonPaginateEntity = PaginatePokemonEntity(
  count: 1302,
  results: [tMockPokemonEntity],
);

const tMockPokemonDetailsEntity = PokemonDetailsEntity(
  id: 0,
  weight: 0,
  height: 0,
  name: 'name',
  locationAreaEncounters: 'locationAreaEncounters',
  types: [],
  stats: [],
  gif: 'gif',
  abilityName: 'abilityName',
);

const tMockEvolutionChainEntity = EvolutionChainEntity(
  species: EvolvesSpecieEntity(name: 'name', url: 'url'),
  evolvesTo: [],
);

Map<String, dynamic> tMockPokemonEvolutionChain = {
  'evolution_chain': {
    'url': 'https://pokeapi.co/api/v2/evolution-chain/77/',
  }
};

Map<String, dynamic> tMockPokemon = {
  'name': 'bulbasaur',
  'url': 'https://pokeapi.co/api/v2/pokemon/1/'
};

Map<String, dynamic> tMockEvolvesSpecie = {
  'name': 'bulbasaur',
  'url': 'https://pokeapi.co/api/v2/pokemon-species/1/'
};

Map<String, dynamic> tMockEvolutionChain = {
  'baby_trigger_item': null,
  'chain': {
    'evolution_details': [],
    'evolves_to': [
      {
        'evolution_details': [
          {
            'gender': null,
            'held_item': null,
            'item': null,
            'known_move': null,
            'known_move_type': null,
            'location': null,
            'min_affection': null,
            'min_beauty': null,
            'min_happiness': null,
            'min_level': 16,
            'needs_overworld_rain': false,
            'party_species': null,
            'party_type': null,
            'relative_physical_stats': null,
            'time_of_day': '',
            'trade_species': null,
            'trigger': {
              'name': 'level-up',
              'url': 'https://pokeapi.co/api/v2/evolution-trigger/1/'
            },
            'turn_upside_down': false
          }
        ],
        'evolves_to': [
          {
            'evolution_details': [
              {
                'gender': null,
                'held_item': null,
                'item': null,
                'known_move': null,
                'known_move_type': null,
                'location': null,
                'min_affection': null,
                'min_beauty': null,
                'min_happiness': null,
                'min_level': 32,
                'needs_overworld_rain': false,
                'party_species': null,
                'party_type': null,
                'relative_physical_stats': null,
                'time_of_day': '',
                'trade_species': null,
                'trigger': {
                  'name': 'level-up',
                  'url': 'https://pokeapi.co/api/v2/evolution-trigger/1/'
                },
                'turn_upside_down': false
              }
            ],
            'evolves_to': [],
            'is_baby': false,
            'species': {
              'name': 'venusaur',
              'url': 'https://pokeapi.co/api/v2/pokemon-species/3/'
            }
          }
        ],
        'is_baby': false,
        'species': {
          'name': 'ivysaur',
          'url': 'https://pokeapi.co/api/v2/pokemon-species/2/'
        }
      }
    ],
    'is_baby': false,
    'species': {
      'name': 'bulbasaur',
      'url': 'https://pokeapi.co/api/v2/pokemon-species/1/'
    }
  },
  'id': 1
};

Map<String, dynamic> tMockPokemonPaginate = {
  'count': 1302,
  'next': 'https://pokeapi.co/api/v2/pokemon?offset=10&limit=10',
  'previous': null,
  'results': [
    {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'},
    {'name': 'ivysaur', 'url': 'https://pokeapi.co/api/v2/pokemon/2/'},
    {'name': 'venusaur', 'url': 'https://pokeapi.co/api/v2/pokemon/3/'},
    {'name': 'charmander', 'url': 'https://pokeapi.co/api/v2/pokemon/4/'},
    {'name': 'charmeleon', 'url': 'https://pokeapi.co/api/v2/pokemon/5/'},
    {'name': 'charizard', 'url': 'https://pokeapi.co/api/v2/pokemon/6/'},
    {'name': 'squirtle', 'url': 'https://pokeapi.co/api/v2/pokemon/7/'},
    {'name': 'wartortle', 'url': 'https://pokeapi.co/api/v2/pokemon/8/'},
    {'name': 'blastoise', 'url': 'https://pokeapi.co/api/v2/pokemon/9/'},
    {'name': 'caterpie', 'url': 'https://pokeapi.co/api/v2/pokemon/10/'}
  ]
};

Map<String, dynamic> tMockPokemonDetails = {
  'abilities': [
    {
      'ability': {
        'name': 'overgrow',
        'url': 'https://pokeapi.co/api/v2/ability/65/'
      },
      'is_hidden': false,
      'slot': 1
    },
    {
      'ability': {
        'name': 'chlorophyll',
        'url': 'https://pokeapi.co/api/v2/ability/34/'
      },
      'is_hidden': true,
      'slot': 3
    }
  ],
  'base_experience': 64,
  'height': 7,
  'held_items': [],
  'id': 1,
  'is_default': true,
  'location_area_encounters': 'https://pokeapi.co/api/v2/pokemon/1/encounters',
  'name': 'bulbasaur',
  'order': 1,
  'past_abilities': [],
  'past_types': [],
  'species': {
    'name': 'bulbasaur',
    'url': 'https://pokeapi.co/api/v2/pokemon-species/1/'
  },
  'sprites': {
    'back_default':
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png',
    'back_female': null,
    'back_shiny':
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png',
    'back_shiny_female': null,
    'front_default':
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
    'front_female': null,
    'front_shiny':
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png',
    'front_shiny_female': null,
    'other': {
      'dream_world': {
        'front_default':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg',
        'front_female': null
      },
      'home': {
        'front_default':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png',
        'front_female': null,
        'front_shiny':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png',
        'front_shiny_female': null
      },
      'official-artwork': {
        'front_default':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
        'front_shiny':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png'
      },
      'showdown': {
        'back_default':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/1.gif',
        'back_female': null,
        'back_shiny':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/shiny/1.gif',
        'back_shiny_female': null,
        'front_default':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/1.gif',
        'front_female': null,
        'front_shiny':
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/1.gif',
        'front_shiny_female': null
      }
    }
  },
  'stats': [
    {
      'base_stat': 45,
      'effort': 0,
      'stat': {'name': 'hp', 'url': 'https://pokeapi.co/api/v2/stat/1/'}
    },
    {
      'base_stat': 49,
      'effort': 0,
      'stat': {'name': 'attack', 'url': 'https://pokeapi.co/api/v2/stat/2/'}
    },
    {
      'base_stat': 49,
      'effort': 0,
      'stat': {'name': 'defense', 'url': 'https://pokeapi.co/api/v2/stat/3/'}
    },
    {
      'base_stat': 65,
      'effort': 1,
      'stat': {
        'name': 'special-attack',
        'url': 'https://pokeapi.co/api/v2/stat/4/'
      }
    },
    {
      'base_stat': 65,
      'effort': 0,
      'stat': {
        'name': 'special-defense',
        'url': 'https://pokeapi.co/api/v2/stat/5/'
      }
    },
    {
      'base_stat': 45,
      'effort': 0,
      'stat': {'name': 'speed', 'url': 'https://pokeapi.co/api/v2/stat/6/'}
    }
  ],
  'types': [
    {
      'slot': 1,
      'type': {'name': 'grass', 'url': 'https://pokeapi.co/api/v2/type/12/'}
    },
    {
      'slot': 2,
      'type': {'name': 'poison', 'url': 'https://pokeapi.co/api/v2/type/4/'}
    }
  ],
  'weight': 69
};

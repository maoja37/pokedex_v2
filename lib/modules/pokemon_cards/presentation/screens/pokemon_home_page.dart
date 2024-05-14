import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_v2/global/constants/app_color.dart';
import 'package:pokedex_v2/global/constants/spacing.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/cubit/pokemon_cubit.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/widgets/card_carousel.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/widgets/category_row.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/widgets/error_message_view.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/widgets/header.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/widgets/title_row.dart';

class PokemonHomePage extends StatefulWidget {
  const PokemonHomePage({super.key});

  @override
  State<PokemonHomePage> createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage> {

  @override
  void initState() {
    context.read<PokemonCubit>().getPokemonList();
    super.initState();
  }
  
  final List<String> pokemonCategories = <String>[
    'All',
    'Pokemon',
    'Moves',
    'Items',
    'Location',
    'Ability',
    'Type Charts',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMartinique,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Header(),
                  const VerticalSpacing(20),
                  const TitleRow(),
                  const VerticalSpacing(20),
                  CategoryRow(
                    items: pokemonCategories,
                  ),
                  const VerticalSpacing(20),
                  BlocBuilder<PokemonCubit, PokemonState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return  const ErrorMessageScreen(errorMessage: 'Something went wrong');
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        loaded: (pokemons) => CardCarousel(
                          pokemonList: pokemons,
                        ),
                        error: (e) => const ErrorMessageScreen(errorMessage: 'Something went wrong')
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

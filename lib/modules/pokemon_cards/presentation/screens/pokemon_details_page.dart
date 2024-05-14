import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_v2/global/constants/app_color.dart';
import 'package:pokedex_v2/global/constants/spacing.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/cubit/pokemon_cubit.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/widgets/name_row.dart';

class PokemonDetailsPage extends StatefulWidget {
  final String id;
  const PokemonDetailsPage({super.key, required this.id});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  PokemonEntity pokemone = const PokemonEntity(
      id: null,
      name: '',
      images: Images(small: '', large: ''),
      hp: '',
      level: '',
      supertype: '',
      abilities: []);
  @override
  void initState() {
    context.read<PokemonCubit>().getIndividualPokemon(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMartinique,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BlocConsumer<PokemonCubit, PokemonState>(
              listener: (BuildContext context, PokemonState state) {
                state.maybeWhen(
                  orElse: () {},
                  loadIndividual: (pokemon) {
                    setState(() {
                      pokemone = pokemon;
                    });
                  },
                );
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpacing(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => context.router.pop(),
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const VerticalSpacing(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state.maybeWhen(
                          orElse: () {
                            return const Placeholder();
                          },
                          loading: () {
                            return const CircularProgressIndicator();
                          },
                          loadIndividual: (pokemon) {
                            return CachedNetworkImage(
                              imageUrl: pokemone.images!.large,
                              height: MediaQuery.of(context).size.height * 0.3,
                            );
                          },
                          error: (e) {
                            return const Placeholder();
                          },
                        ),
                      ],
                    ),
                    const VerticalSpacing(30),
                    NameRow(pokemone: pokemone),
                    const VerticalSpacing(30),
                    state.maybeWhen(
                      orElse: () => const Text(''),
                      loadIndividual: (p) => Text(
                        pokemone.abilities!.first.text,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    StatsRow(pokemone: pokemone)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({
    super.key,
    required this.pokemone,
  });

  final PokemonEntity pokemone;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpacing(30),
            const Text(
              'HP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const VerticalSpacing(10),
            Text(
              pokemone.hp ?? '',
              style:  TextStyle(
                color: Colors.yellow[600],
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpacing(30),
            const Text(
              'Level',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const VerticalSpacing(10),
            Text(
              pokemone.level ?? '',
              style: TextStyle(
                color: Colors.yellow[600],
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpacing(30),
            const Text(
              'Supertype',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const VerticalSpacing(10),
            Text(
              pokemone.supertype ?? '',
              style:  TextStyle(
                color:Colors.yellow[600],
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      
      ],
    );
  }
}

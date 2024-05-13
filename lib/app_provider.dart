import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_v2/locator.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/cubit/pokemon_cubit.dart';

class AppProvider {
  static getList() {
    return [
      BlocProvider(
        create: (context) => locator<PokemonCubit>(),
      ),
    ];
  }
}

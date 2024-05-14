import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_v2/global/configs/failures.dart';
import 'package:pokedex_v2/global/configs/usecase.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/usecases/get_indivual_pokemon_usecase.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/usecases/get_list_of_pokemons.dart';

part 'pokemon_cubit.freezed.dart';
part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final GetListOfPokemonsUsecase getListOfPokemonsUsecase;
  final GetIndiviPokemonUsecase getIndiviPokemonUsecase;

  PokemonCubit({
    required this.getListOfPokemonsUsecase,
    required this.getIndiviPokemonUsecase,
  }) : super(const PokemonState.initial());

  Future<void> getPokemonList() async {
    emit(const PokemonState.loading());
    final result = await getListOfPokemonsUsecase.call(NoParams());
    result.fold(
      (failure) => emit(PokemonState.error(failure)),
      (pokemons) => emit(PokemonState.loaded(pokemons)),
    );
  }

  Future<void> getIndividualPokemon(String id) async {
    emit(const PokemonState.loading());
    final result = await getIndiviPokemonUsecase.call(id);
    result.fold(
      (failure) => emit(PokemonState.error(failure)),
      (pokemon) => emit(PokemonState.loadIndividual(pokemon)),
    );
  }
}

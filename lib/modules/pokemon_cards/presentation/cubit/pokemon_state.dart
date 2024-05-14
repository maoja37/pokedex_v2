part of 'pokemon_cubit.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState.initial() = _Initial;
  const factory PokemonState.loading() = _Loading;
  const factory PokemonState.loaded(List<PokemonEntity> pokemons) = _Loaded;
  const factory PokemonState.loadIndividual(PokemonEntity pokemon)= _LoadIndividual;
  const factory PokemonState.error(Failure failure) = _Error;
}

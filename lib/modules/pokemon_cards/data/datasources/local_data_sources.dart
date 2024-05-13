import 'package:pokedex_v2/global/storage/app_storage.dart';
import 'package:pokedex_v2/locator.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';

abstract class PokemonLocalDataSource {
  Future<void> cachePokemons(List<PokemonEntity> pokemonList);
  Future<List<PokemonEntity>> getCachedPokemonList();
}

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final localDataStorage = locator<AppStorage>();

  @override
  Future<void> cachePokemons(List<PokemonEntity> pokemonList) async {
    localDataStorage.setPokemonList(pokemonList);
  }

  @override
  Future<List<PokemonEntity>> getCachedPokemonList() async =>
      localDataStorage.getPokemonList;
}

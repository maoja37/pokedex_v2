import 'dart:async';

import 'package:pokedex_v2/global/network/api_eror.dart';
import 'package:pokedex_v2/global/network/endpoint.dart';
import 'package:pokedex_v2/global/network/network_provider.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonEntity> getIndividualPokemon(String id);
  Future<List<PokemonEntity>> getListOfPokemons();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final NetworkProvider networkProvider;

  PokemonRemoteDataSourceImpl({required this.networkProvider});

  @override
  Future<List<PokemonEntity>> getListOfPokemons() async {
    List<PokemonEntity> pokemonList = [];
    try {
      final response = await networkProvider.call(
          path: Endpoint.cards,
          method: RequestMethod.get,
          queryParameters: {'pageSize': 20});

      if (response!.statusCode == 200) {
        final data = response.data["data"];
        if (data is List) {
          pokemonList = data.map((e) => PokemonEntity.fromJson(e)).toList();
        } else {
          throw Exception('Data received is not a list');
        }
      } else {
        throw Exception(
            'Failed to load Pokemons with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
    return pokemonList;
  }

  @override
  Future<PokemonEntity> getIndividualPokemon(String id) async {
    late PokemonEntity pokemon;
    try {
      final response = await networkProvider.call(
          path: '${Endpoint.cards}/$id', method: RequestMethod.get);

      if (response!.statusCode == 200) {
        pokemon = PokemonEntity.fromJson(response.data["data"]);
      }
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
    return pokemon;
  }
}

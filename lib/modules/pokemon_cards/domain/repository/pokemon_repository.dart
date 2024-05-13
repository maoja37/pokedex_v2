import 'package:dartz/dartz.dart';
import 'package:pokedex_v2/global/configs/failures.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonEntity>> getIndividualPokemon(String id);
  Future<Either<Failure, List<PokemonEntity>>> getListOfPokemons();
}
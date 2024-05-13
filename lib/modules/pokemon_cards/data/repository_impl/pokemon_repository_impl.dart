import 'package:dartz/dartz.dart';
import 'package:pokedex_v2/global/configs/exceptions.dart';
import 'package:pokedex_v2/global/configs/failures.dart';
import 'package:pokedex_v2/global/network/network_info.dart';
import 'package:pokedex_v2/modules/pokemon_cards/data/datasources/local_data_sources.dart';
import 'package:pokedex_v2/modules/pokemon_cards/data/datasources/remote_data_sources.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PokemonEntity>> getIndividualPokemon(String id) async {
    try {
      final pokemon = await remoteDataSource.getIndividualPokemon(id);
      return Right(pokemon);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PokemonEntity>>> getListOfPokemons() async {
    if (await networkInfo.isConnected) {
      try {
        final pokemons = await remoteDataSource.getListOfPokemons();
        await localDataSource.cachePokemons(pokemons);
        return Right(pokemons);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        return Left(UnknownFailure());
      }
    } else {
      try {
        final pokemons = await localDataSource.getCachedPokemonList();
        return Right(pokemons);
      } on CacheException {
        return Left(CacheFailure());
      } catch (e) {
        return Left(UnknownFailure());
      }
    }
  }
}

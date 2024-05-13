import 'package:dartz/dartz.dart';
import 'package:pokedex_v2/global/configs/failures.dart';
import 'package:pokedex_v2/global/configs/usecase.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/repository/pokemon_repository.dart';

class GetListOfPokemonsUsecase extends UseCase<List<PokemonEntity>, NoParams> {
  final PokemonRepository repository;

  GetListOfPokemonsUsecase({required this.repository});
  @override
  Future<Either<Failure, List<PokemonEntity>>> call(NoParams param) {
    return repository.getListOfPokemons();
  }
}
import 'package:dartz/dartz.dart';
import 'package:pokedex_v2/global/configs/failures.dart';
import 'package:pokedex_v2/global/configs/usecase.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/repository/pokemon_repository.dart';

class GetIndiviPokemonUsecase extends UseCase<PokemonEntity, String> {
  final PokemonRepository repository;

  GetIndiviPokemonUsecase({required this.repository});
  @override
  Future<Either<Failure, PokemonEntity>> call(String param) {
    return repository.getIndividualPokemon(param);
  }
}

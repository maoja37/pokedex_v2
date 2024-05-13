import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_entity.freezed.dart';
part 'pokemon_entity.g.dart';

@freezed
class PokemonEntity with _$PokemonEntity {
  const factory PokemonEntity({
    required String id,
    required String name,
    required Images images,
    required List<AbilityEntity> abilities,
  }) = _PokemonEntity;

  factory PokemonEntity.fromJson(Map<String, dynamic> json) => _$PokemonEntityFromJson(json);

}


@freezed
class AbilityEntity with _$AbilityEntity{
  const factory AbilityEntity({
    required String name,
    required String text,
    required String type,
  }) = _AbilityEntity;

  factory AbilityEntity.fromJson(Map<String, dynamic> json) => _$AbilityEntityFromJson(json);


}

@freezed
class Images  with _$Images{
  const factory Images({
    required String small,
    required String large,
  }) = _Images;

factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
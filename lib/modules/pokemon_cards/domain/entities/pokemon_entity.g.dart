// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonEntityImpl _$$PokemonEntityImplFromJson(Map<String, dynamic> json) =>
    _$PokemonEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => AbilityEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokemonEntityImplToJson(_$PokemonEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'abilities': instance.abilities,
    };

_$AbilityEntityImpl _$$AbilityEntityImplFromJson(Map<String, dynamic> json) =>
    _$AbilityEntityImpl(
      name: json['name'] as String,
      text: json['text'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$AbilityEntityImplToJson(_$AbilityEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'text': instance.text,
      'type': instance.type,
    };

_$ImagesImpl _$$ImagesImplFromJson(Map<String, dynamic> json) => _$ImagesImpl(
      small: json['small'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$$ImagesImplToJson(_$ImagesImpl instance) =>
    <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };

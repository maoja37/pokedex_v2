import 'dart:convert';

import 'package:pokedex_v2/global/storage/app_storage_key.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/entities/pokemon_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  late SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

   setPokemonList(List<PokemonEntity> value) {
    String jsonString = jsonEncode(value.map((e) => e.toJson()).toList());
    _prefs.setString(AppStorageKey.pokemons.value, jsonString);
  }

  List<PokemonEntity> get getPokemonList {
    String? jsonString = _prefs.getString(AppStorageKey.pokemons.value);

    if (jsonString == null) {
      return [];
    } else {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => PokemonEntity.fromJson(e)).toList();
    }
  }
}

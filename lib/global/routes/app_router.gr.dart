// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;
import 'package:pokedex_v2/modules/pokemon_cards/presentation/screens/pokemon_details_page.dart'
    as _i2;
import 'package:pokedex_v2/modules/pokemon_cards/presentation/screens/pokemon_home_page.dart'
    as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    PokemonHomeRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.PokemonHomePage(),
      );
    },
    PokemonDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailsRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.PokemonDetailsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          PokemonHomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          PokemonDetailsRoute.name,
          path: 'pokemonDetails/:id',
        ),
      ];
}

/// generated route for
/// [_i1.PokemonHomePage]
class PokemonHomeRoute extends _i3.PageRouteInfo<void> {
  const PokemonHomeRoute()
      : super(
          PokemonHomeRoute.name,
          path: '/',
        );

  static const String name = 'PokemonHomeRoute';
}

/// generated route for
/// [_i2.PokemonDetailsPage]
class PokemonDetailsRoute extends _i3.PageRouteInfo<PokemonDetailsRouteArgs> {
  PokemonDetailsRoute({
    _i5.Key? key,
    required String id,
  }) : super(
          PokemonDetailsRoute.name,
          path: 'pokemonDetails/:id',
          args: PokemonDetailsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'PokemonDetailsRoute';
}

class PokemonDetailsRouteArgs {
  const PokemonDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final String id;

  @override
  String toString() {
    return 'PokemonDetailsRouteArgs{key: $key, id: $id}';
  }
}

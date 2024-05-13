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
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:pokedex_v2/modules/pokemon_cards/presentation/screens/pokemon_home_page.dart'
    as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    PokemonHomeRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.PokemonHomePage(),
      );
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          PokemonHomeRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [_i1.PokemonHomePage]
class PokemonHomeRoute extends _i2.PageRouteInfo<void> {
  const PokemonHomeRoute()
      : super(
          PokemonHomeRoute.name,
          path: '/',
        );

  static const String name = 'PokemonHomeRoute';
}

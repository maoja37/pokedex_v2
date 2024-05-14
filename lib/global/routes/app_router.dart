import 'package:auto_route/auto_route.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/screens/pokemon_details_page.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/screens/pokemon_home_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: [
    AutoRoute(
      page: PokemonHomePage,
      initial: true,
    ),
    AutoRoute(
      page: PokemonDetailsPage,
      path: 'pokemonDetails/:id',
    ),
  ],
)
class $AppRouter {}

import 'package:auto_route/auto_route.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/screens/pokemon_home_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: [
    AutoRoute(
    //  path: '/',
      page: PokemonHomePage,
      initial: true,
    ),
  
  ],
)
class $AppRouter {}
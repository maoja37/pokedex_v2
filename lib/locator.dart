import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_v2/global/network/network_info.dart';
import 'package:pokedex_v2/global/network/network_provider.dart';
import 'package:pokedex_v2/global/storage/app_storage.dart';
import 'package:pokedex_v2/modules/pokemon_cards/data/datasources/local_data_sources.dart';
import 'package:pokedex_v2/modules/pokemon_cards/data/datasources/remote_data_sources.dart';
import 'package:pokedex_v2/modules/pokemon_cards/data/repository_impl/pokemon_repository_impl.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/repository/pokemon_repository.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/usecases/get_indivual_pokemon_usecase.dart';
import 'package:pokedex_v2/modules/pokemon_cards/domain/usecases/get_list_of_pokemons.dart';
import 'package:pokedex_v2/modules/pokemon_cards/presentation/cubit/pokemon_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  await _initSharedPref();

  locator.registerLazySingleton<PokemonCubit>(
    () => PokemonCubit(
        getListOfPokemonsUsecase: locator(),
        getIndiviPokemonUsecase: locator()),
  );

  //usecases
  locator.registerLazySingleton<GetListOfPokemonsUsecase>(
    () => GetListOfPokemonsUsecase(repository: locator()),
  );
  locator.registerLazySingleton(
      () => GetIndiviPokemonUsecase(repository: locator()));

  //repositories
  locator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
        remoteDataSource: locator(),
        localDataSource: locator(),
        networkInfo: locator()),
  );

  //datasources
  locator.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(networkProvider: locator()),
  );
  locator.registerLazySingleton<PokemonLocalDataSource>(
    () => PokemonLocalDataSourceImpl(),
  );
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(locator()),
  );

  locator.registerLazySingleton<NetworkProvider>(() => NetworkProviderImpl());

  //external
  locator.registerLazySingleton(() => DataConnectionChecker());

  // storage
  locator.registerLazySingleton<AppStorage>(() => AppStorage());
}

Future<void> _initSharedPref() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPref);
}

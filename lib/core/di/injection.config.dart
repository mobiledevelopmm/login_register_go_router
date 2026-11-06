// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:login_register_gorouter/core/di/injection.dart' as _i811;
import 'package:login_register_gorouter/data/repositories/auth_repository.dart'
    as _i35;
import 'package:login_register_gorouter/data/services/auth_service.dart'
    as _i355;
import 'package:login_register_gorouter/data/services/storage_service.dart'
    as _i907;
import 'package:login_register_gorouter/presentation/blocs/authentication/authentication_cubit.dart'
    as _i36;
import 'package:login_register_gorouter/presentation/blocs/global/global_cubit.dart'
    as _i477;
import 'package:login_register_gorouter/presentation/blocs/login/login_cubit.dart'
    as _i774;
import 'package:login_register_gorouter/presentation/blocs/register/register_cubit.dart'
    as _i1071;
import 'package:login_register_gorouter/presentation/navigation/router.dart'
    as _i194;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i477.GlobalCubit>(() => _i477.GlobalCubit());
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i194.NavigationRouter>(() => _i194.NavigationRouter());
    gh.lazySingleton<_i907.StorageService>(
      () => _i907.StorageService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i355.AuthService>(
      () => _i355.AuthService(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i35.AuthRepository>(
      () => _i35.AuthRepository(
        gh<_i355.AuthService>(),
        gh<_i907.StorageService>(),
      ),
    );
    gh.singleton<_i36.AuthenticationCubit>(
      () => _i36.AuthenticationCubit(gh<_i35.AuthRepository>()),
    );
    gh.factory<_i774.LoginCubit>(
      () => _i774.LoginCubit(
        gh<_i35.AuthRepository>(),
        gh<_i36.AuthenticationCubit>(),
      ),
    );
    gh.factory<_i1071.RegisterCubit>(
      () => _i1071.RegisterCubit(
        gh<_i35.AuthRepository>(),
        gh<_i36.AuthenticationCubit>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i811.RegisterModule {}

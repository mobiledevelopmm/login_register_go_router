import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repositories/auth_repository.dart';
import '../authentication/authentication_cubit.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repository;
  final AuthenticationCubit _authenticationCubit;

  LoginCubit(
      this._repository,
      this._authenticationCubit,
      ) : super(const LoginState.initial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const LoginState.loading());

    try {
      await _repository.login(
        email: email,
        password: password,
      );

      await _authenticationCubit.loadData();

      if (!isClosed) {
        emit(const LoginState.success());
      }
    } catch (e) {
      if (!isClosed) {
        emit(LoginState.error(
          e.toString().replaceFirst('Exception: ', ''),
        ));
      }
    }
  }
}
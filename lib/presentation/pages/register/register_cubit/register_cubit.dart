import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:login_register_gorouter/presentation/pages/register/register_cubit/register_state.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../../../blocs/authentication/authentication_cubit.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _repository;
  final AuthenticationCubit _authenticationCubit;

  RegisterCubit(
      this._repository,
      this._authenticationCubit,
      ) : super(const RegisterState.initial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const RegisterState.loading());

    try {
      await _repository.register(
        name: name,
        email: email,
        password: password,
      );

      await _authenticationCubit.loadData();

      if (!isClosed) {
        emit(const RegisterState.success());
      }
    } catch (e) {
      if (!isClosed) {
        emit(RegisterState.error(e.toString()));
      }
    }
  }
}
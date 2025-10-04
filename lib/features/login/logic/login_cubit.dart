
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

   emitLogin({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      final response = await AuthRepo.login(email: email, password: password);
      if (response?.isNotEmpty ) {
        emit(LoginSuccessState());
      } else {
        emit(
          LoginErrorState(
            "Login failed with status code: ${response['status']}",
          ),
        );
      }
    }  catch (e) {
      emit(LoginErrorState(e.toString()));
      if (e is DioException) {
        emit(LoginErrorState(e.toString()));
      }
    }
  }
}

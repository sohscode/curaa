import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../data/model/create_account_model.dart';
import '../data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  emitRegister({required CreateAccountModel user}) async {
    emit(RegisterLoadingState());
    try {
      final response = await CreateAccountRepo.createAccount(user: user);
      if (response.isNotEmpty ) {
        emit(RegisterSuccessState());
      }
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }
}

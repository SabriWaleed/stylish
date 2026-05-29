import 'package:ecommerce_project/Features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit({required this.authRepo})
    : super(
        RegisterInitial(),
      ); // بحقنله الريبو ال عملتها وبديله اول ستيت هيعملها
  // دي الداله ال اليو اي بيناديها لما المستخدم يضغط ريجستر
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String avatarURL,
  }) async {
    try {
      emit(RegisterLoading());
      final result = await authRepo.register(
        name: name,
        email: email,
        password: password,
        avatarURL: avatarURL,
      );
      result.fold(
        (failure) => emit(RegisterError(errorMessage: failure.errorMessage)),
        (responseData) => emit(RegisterSuccess(responseData: responseData)),
      );
    } catch (e) {
      emit(RegisterError(errorMessage: e.toString()));
    }
  }
}

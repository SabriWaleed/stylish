import 'package:ecommerce_project/Features/auth/data/repos/auth_repo.dart';
import 'package:ecommerce_project/Features/auth/presentation/manager/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo)
    : super(LoginInitial()); // بحقنله الريبو ال عملتها وبديله اول ستيت هيعملها
  //  دي الداله ال اليو اي بيناديها لما المستخدم يضغط لوج ان
  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginLoading());

      final result = await authRepo.login(email: email, password: password);

      result.fold(
        // تبع باكدج دارت دوت زييد
        (failure) {
          emit(LoginFailure(errorMessage: failure.errorMessage));
        },
        (success) {
          emit(LoginSuccess());
        },
      );
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}

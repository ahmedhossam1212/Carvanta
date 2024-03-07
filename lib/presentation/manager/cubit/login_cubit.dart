import 'package:carvanta_i/models/login_model.dart';
import 'package:carvanta_i/presentation/manager/state/login_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(GoogleInitLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  static final googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    emit(GoogleLoadingLoginState());
    googleSignIn.signIn().then((result) {
      result?.authentication.then((googleKey) {
        //print("accessToken :  ${googleKey.accessToken}");
        emit(GoogleSuccessLoginState());
      }).catchError((err) {
        emit(GoogleErrLoginState());
      });
    }).catchError((err) {
      emit(GoogleErrLoginState());
    });
  }

  static Future<GoogleSignInAccount?> logOut() => googleSignIn.disconnect();

  void emailLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    final response = await Dio().post("https://carvanta-eg.com/api/v1/login",
        data: {
          'email': email,
          'password': password,
        },
        options:
            Options(headers: {'Accept': 'application/json', 'lang': 'ar'}));
    loginModel = LoginModel.fromJson(response.data);
    emit(LoginSuccessState());

    emit(LoginErrState());
  }
}

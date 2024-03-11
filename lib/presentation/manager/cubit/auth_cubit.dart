import 'dart:developer';

import 'package:carvanta_i/models/user_model.dart';
import 'package:carvanta_i/presentation/manager/state/auth_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());
  static AuthCubit get(context) => BlocProvider.of(context);

  UserModel? user;
  static final googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    emit(GoogleLoadingLoginState());
    googleSignIn.signIn().then((result) {
      result?.authentication.then((googleKey) {
        //log("accessToken :  ${googleKey.accessToken}");
        emit(GoogleSuccessLoginState());
      }).catchError((err) {
        emit(GoogleErrLoginState());
      });
    }).catchError((err) {
      emit(GoogleErrLoginState());
    });
  }

  static Future<GoogleSignInAccount?> logOut() => googleSignIn.disconnect();

  void createUser({
    required String email,
    required String name,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    try {
      final response = await Dio().post(
        "https://carvanta-eg.com/api/v1/register",
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
        },
        options: Options(headers: {'Accept': 'application/json', 'lang': 'ar'}),
      );
      user = UserModel.fromJson(response.data);

      emit(RegisterSuccessState());
    } catch (e) {
      emit(RegisterErrState());
      log(user!.message);
    }
  }

  void loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final response = await Dio().post("https://carvanta-eg.com/api/v1/login",
          data: {
            'email': email,
            'password': password,
          },
          options:
              Options(headers: {'Accept': 'application/json', 'lang': 'ar'}));
      user = UserModel.fromJson(response.data);
      log(user!.message);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrState());
      log(user!.message);
    }
  }
}

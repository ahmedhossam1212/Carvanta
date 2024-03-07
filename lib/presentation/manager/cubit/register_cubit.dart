import 'package:carvanta_i/models/user_model.dart';
import 'package:carvanta_i/presentation/manager/state/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  UserModel? user;

  Future<void> createUser({
    required String email,
    required String name,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoadingState());

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
    print(user!.message);
    emit(RegisterErrState());
  }
}

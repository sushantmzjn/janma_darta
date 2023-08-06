import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:janma_darta/main.dart';
import 'package:janma_darta/model/auth_model/user_state.dart';
import 'package:janma_darta/services/auth_services.dart';

import '../model/auth_model/user.dart';

final authProvider = StateNotifierProvider<AuthProvider, UserState>((ref) =>
AuthProvider(UserState(isLoad: false, isError: false, errMessage: '',isSuccess: false, user: ref.watch(box)))
);

class AuthProvider extends StateNotifier<UserState>{
  AuthProvider(super.state);

  //login
  Future<void> userLogin({
    required String email,
    required String password,
    required String fcm_token,
})async{
    state = state.copyWith(isLoad: true, isError: false, isSuccess: false);
    final res = await AuthServices.userLogin(email: email, password: password, fcm_token: fcm_token);
    res.fold(
            (l){
          state = state.copyWith(isLoad: false, isError: true, isSuccess: false, errMessage: l, );
        },
            (r) {
          state = state.copyWith(isLoad: false, isError: false, isSuccess: true, errMessage: '', user: [r]);
        }
    );
  }

  //user logout
  void  userLogOut() async{
    final box =  Hive.box<User>('user');
    box.clear();
    state = state.copyWith(user: []);
  }

}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:janma_darta/model/auth_model/user.dart';

import '../api.dart';

class AuthServices{
  static Dio dio = Dio();

  //login
static Future<Either<String, User>> userLogin({
  required String email,
  required String password,
  required String fcm_token,
})async{
  try{
    final res = await dio.post(Api.adminLogin,
    data: {
      'email' : email,
      'password' : password,
      'fcm_token' :  fcm_token
    });
    final user =User.fromJson(res.data);
    final box = Hive.box<User>('user');
    box.clear();
    box.add(user);

    print(res.data);
    return Right(user);

  }on DioError catch(err){
    print(err.response?.data['message']);
    return Left(err.response?.data['message']);
  }
}
}
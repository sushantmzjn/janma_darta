import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:janma_darta/view/login_status.dart';
import 'constant/colors.dart';
import 'model/auth_model/user.dart';

final box = Provider<List<User>>((ref) => []);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  final userBox = await Hive.openBox<User>('user');

  runApp(ProviderScope(
    overrides: [
      box.overrideWithValue(userBox.values.toList())
    ],
      child: const MyApp()));


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              color: lightWhite,
              surfaceTintColor: Colors.transparent
            ),
            scaffoldBackgroundColor: lightWhite,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.white,
            ),
          ),
          home: LoginStatus(),
        );
      },
    );
  }
}

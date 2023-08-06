import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:janma_darta/provider/auth_provider.dart';
import 'package:janma_darta/view/home_page.dart';
import 'auth_page/login_page.dart';

class LoginStatus extends ConsumerWidget {
  const LoginStatus({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvider);
    return Scaffold(
      body: auth.user.isEmpty ? LoginPage() : HomePage(),
    );
  }
}

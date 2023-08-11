import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validation/form_validation.dart';
import 'package:get/get.dart';
import 'package:janma_darta/common%20widget/custom_button.dart';
import 'package:janma_darta/common%20widget/toast_alert.dart';
import 'package:janma_darta/constant/text_styles.dart';
import 'package:janma_darta/view/login_status.dart';
import '../../common widget/custom_textfield.dart';
import '../../constant/colors.dart';
import '../../provider/auth_provider.dart';
import '../janma_darta/info_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      if (next.isError) {
        Toasts.showFailure(next.errMessage);
      } else if (next.isSuccess) {
        Toasts.showSuccess('Login Success');
        Get.offAll(() => LoginStatus());
      }
    });
    final auth = ref.watch(authProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyles.appBarStyle,
          ),
          centerTitle: true,
        ),
        body: FormBuilder(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
            children: [
              SizedBox(
                height: 40.h,
              ),
              CustomTextField(
                  controller: emailController,
                  labelText: 'Email',
                  hintText: 'Email',
                  name: 'email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    final validator = Validator(validators: [
                      const RequiredValidator(),
                      const EmailValidator()
                    ]);
                    return validator.validate(
                      label: 'This field',
                      value: val,
                    );
                  }),
              CustomTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  hintText: 'Password',
                  name: 'password',
                  obscureText: obscureText,
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    setState(() {});
                  },
                  suffixIcon: passwordController.text.trim().isEmpty
                      ? null
                      : Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(60.0),
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: obscureText
                                  ? Icon(
                                      Icons.lock,
                                      color: primaryColor,
                                    )
                                  : Icon(
                                      Icons.lock_open,
                                      color: primaryColor,
                                    )),
                        ),
                  validator: (val) {
                    final validator =
                        Validator(validators: [const RequiredValidator()]);
                    return validator.validate(
                      label: 'This field',
                      value: val,
                    );
                  }),
              SizedBox(
                height: 10.h,
              ),
              CustomButtons(
                  onPressed: () {
                    _formKey.currentState!.save();
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.saveAndValidate()) {
                      ref.read(authProvider.notifier).userLogin(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          fcm_token: 'fcm_token');
                    }
                  },
                  text: auth.isLoad ? 'Please wait...' : 'LOGIN')
            ],
          ),
        ));
  }
}

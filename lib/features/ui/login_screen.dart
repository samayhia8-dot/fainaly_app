import 'package:fainaly_app/core/spacing/spacing.dart';
import 'package:fainaly_app/core/themes/my_colors.dart';
import 'package:fainaly_app/core/themes/my_fonts.dart';
import 'package:fainaly_app/features/ui/widgets/NativeLanguageScreen.dart';
import 'package:fainaly_app/features/ui/widgets/custom_auth_text_form_field.dart';
import 'package:fainaly_app/features/ui/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: MyFonts.font18white,
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                verticalSpace(20),
                SizedBox(
                    width: 200.w,
                    child: Image.asset('assets/images/login.png')),
                Text(
                  'For free, join now and start learning',
                  style: MyFonts.font22white,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(20),
                CustomAuthTextFormField(
                    controller: emailController,
                    label: "Email",
                    hintText: "Enter your Email"),
                verticalSpace(10),
                CustomAuthTextFormField(
                    controller: passwordController,
                    label: "Password",
                    hintText: "Enter your Password"),
                verticalSpace(20),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AccountSetupFlow(
                              onComplete: () {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              },
                            ),
                          ),
                        );
                      },
                      child: Text("Login"),
                    )),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do Not Have An Account?',
                      style: MyFonts.font16whitefaded,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ));
                        },
                        child: Text(
                          'Register',
                          style: MyFonts.font16whitefaded
                              .copyWith(color: MyColors.primaryColor),
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

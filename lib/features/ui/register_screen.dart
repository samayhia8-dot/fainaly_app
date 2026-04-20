import 'package:fainaly_app/core/spacing/spacing.dart';
import 'package:fainaly_app/core/themes/my_colors.dart';
import 'package:fainaly_app/core/themes/my_fonts.dart';
import 'package:fainaly_app/features/ui/widgets/custom_auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Register',
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
                    child: ElevatedButton(onPressed: (){}, child: Text("Register"))),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a User?',style: MyFonts.font16whitefaded,),
                    SizedBox(width: 5,),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);                        },
                        child: Text('Login',style: MyFonts.font16whitefaded.copyWith(color: MyColors.primaryColor),)),

                  ],
                )
              ],
            ),
          ),
        ));
  }
}

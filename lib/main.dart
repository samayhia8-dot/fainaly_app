import 'package:fainaly_app/core/themes/my_colors.dart';
import 'package:fainaly_app/core/widgets/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flikka',
        theme:ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: MyColors.darkBlueColor,
          appBarTheme: AppBarTheme(color: MyColors.primaryColor,centerTitle: true),
        ),
        home: OnBoardingScreen(),
      ),
    );
  }
}

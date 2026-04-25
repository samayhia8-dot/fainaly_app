import 'package:fainaly_app/core/spacing/spacing.dart';
import 'package:fainaly_app/core/themes/my_colors.dart';
import 'package:fainaly_app/core/themes/my_fonts.dart';
import 'package:fainaly_app/features/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: pageController,
          children: const [
          buildPage(imagePath: "assets/images/boarding.png", title: "'Confidence in your words'", description: 'With conversation-based learning, you\'ll be talking from lesson one'),
          buildPage(imagePath: "assets/images/boarding1.png", title: "Take your time to learn", description: "Develop a habit of learning and make it a part of your daily routine"),
          buildPage(imagePath: "assets/images/boarding2.png", title: "The lessons you need to learn", description: "Using a variety of learning styles to learn and retain"),
          
        ]), 
        
        Positioned(
          left: MediaQuery.of(context).size.width * 0.4,
          bottom: 350.h,
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: const WormEffect(
              activeDotColor: Color.fromARGB(255, 221, 87, 21),
              dotWidth: 10,
              dotHeight: 10,
            ),
          ),
        )
      ]),
    );
  }
}

class buildPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const buildPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MyColors.darkBlueColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
    
        children: [
          verticalSpace(100),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3.h,
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          verticalSpace(80),
          Text(title,style: MyFonts.font22white,
          
          ),
          verticalSpace(10),
          Text(
              description, style: MyFonts.font16whitefaded,
              textAlign: TextAlign.center,
              ),
              verticalSpace(70),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      backgroundColor: MyColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    
                     child: Text('Choose Language',style: MyFonts.font22white,
                    )),
                  ),
                ],
              ),
              verticalSpace(40),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a User?',style: MyFonts.font16whitefaded,),
                  SizedBox(width: 5,),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      },
                      child: Text('Login',style: MyFonts.font16whitefaded.copyWith(color: MyColors.primaryColor),)),
    
                ],
              )
        ],
      ),
    );
  }
}

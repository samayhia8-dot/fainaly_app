import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


const Color kBackgroundColor = Color(0xFF0D1B2A);
const Color kCardColor = Color(0xFF1A2940);
const Color kPrimaryPurple = Color(0xFF7B5EA7);
const Color kAccentGreen = Color(0xFF4CAF50);
const Color kSelectedBorder = Color(0xFF58CC02);
const Color kTextWhite = Color(0xFFFFFFFF);
const Color kTextGrey = Color(0xFF8A9BB0);
const Color kButtonColor = Color(0xFF4B2D8F);


class LanguageItem {
  final String flag;
  final String name;
  const LanguageItem({required this.flag, required this.name});
}

const List<LanguageItem> kLanguages = [
  LanguageItem(flag: '🇬🇧', name: 'English'),
  LanguageItem(flag: '🇫🇷', name: 'French'),
  LanguageItem(flag: '🇩🇪', name: 'German'),
  LanguageItem(flag: '🇯🇵', name: 'Japanese'),
  LanguageItem(flag: '🇰🇷', name: 'Korean'),
  LanguageItem(flag: '🇭🇺', name: 'Hungarian'),
  LanguageItem(flag: '🇸🇦', name: 'Arabic'),
  LanguageItem(flag: '🇮🇹', name: 'Italian'),
  LanguageItem(flag: '🇵🇹', name: 'Portuguese'),
  LanguageItem(flag: '🇷🇺', name: 'Russian'),
  LanguageItem(flag: '🇳🇱', name: 'Dutch'),
  LanguageItem(flag: '🇨🇳', name: 'Chinese'),
];

class NativeLanguageScreen extends StatefulWidget {
  final VoidCallback onNext;
  const NativeLanguageScreen({super.key, required this.onNext});

  @override
  State<NativeLanguageScreen> createState() => _NativeLanguageScreenState();
}

class _NativeLanguageScreenState extends State<NativeLanguageScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),


              _buildProgressBar(1),
              SizedBox(height: 32.h),


              Text(
                "What's Your Native Language?",
                style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: kTextWhite,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  itemCount: kLanguages.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    final lang = kLanguages[index];
                    final isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? kPrimaryPurple.withOpacity(0.2)
                              : kCardColor,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? kSelectedBorder
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              lang.flag,
                              style: TextStyle(fontSize: 24.sp),
                            ),
                            SizedBox(width: 14.w),
                            Text(
                              lang.name,
                              style: GoogleFonts.nunito(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: kTextWhite,
                              ),
                            ),
                            const Spacer(),
                            if (isSelected)
                              Icon(
                                Icons.check_circle,
                                color: kSelectedBorder,
                                size: 22.sp,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 16.h),

              // Next button
              _buildNextButton(widget.onNext),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}


class LearnLanguageScreen extends StatefulWidget {
  final VoidCallback onNext;
  const LearnLanguageScreen({super.key, required this.onNext});

  @override
  State<LearnLanguageScreen> createState() => _LearnLanguageScreenState();
}

class _LearnLanguageScreenState extends State<LearnLanguageScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildProgressBar(2),
              SizedBox(height: 32.h),
              Text(
                "Which Language Do You Want to Learn?",
                style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: kTextWhite,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  itemCount: kLanguages.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    final lang = kLanguages[index];
                    final isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? kPrimaryPurple.withOpacity(0.2)
                              : kCardColor,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? kSelectedBorder
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(lang.flag,
                                style: TextStyle(fontSize: 24.sp)),
                            SizedBox(width: 14.w),
                            Text(
                              lang.name,
                              style: GoogleFonts.nunito(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: kTextWhite,
                              ),
                            ),
                            const Spacer(),
                            if (isSelected)
                              Icon(Icons.check_circle,
                                  color: kSelectedBorder, size: 22.sp),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              _buildNextButton(widget.onNext),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}


const List<Map<String, String>> kHearAboutOptions = [
  {'icon': '📱', 'label': 'App Store'},
  {'icon': '🔍', 'label': 'Search Engine'},
  {'icon': '👥', 'label': 'Friend / Family'},
  {'icon': '📺', 'label': 'TV / Radio'},
  {'icon': '📸', 'label': 'Instagram'},
  {'icon': '▶️', 'label': 'YouTube'},
  {'icon': '🐦', 'label': 'Twitter / X'},
  {'icon': '💬', 'label': 'Facebook'},
  {'icon': '🎮', 'label': 'TikTok'},
  {'icon': '🌐', 'label': 'Other'},
];

class HearAboutScreen extends StatefulWidget {
  final VoidCallback onNext;
  const HearAboutScreen({super.key, required this.onNext});

  @override
  State<HearAboutScreen> createState() => _HearAboutScreenState();
}

class _HearAboutScreenState extends State<HearAboutScreen> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildProgressBar(3),
              SizedBox(height: 32.h),
              Text(
                "How Did You Hear About Us?",
                style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: kTextWhite,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: kHearAboutOptions.length,
                  itemBuilder: (context, index) {
                    final item = kHearAboutOptions[index];
                    final isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? kPrimaryPurple.withOpacity(0.2)
                              : kCardColor,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? kSelectedBorder
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(item['icon']!,
                                style: TextStyle(fontSize: 20.sp)),
                            SizedBox(width: 8.w),
                            Flexible(
                              child: Text(
                                item['label']!,
                                style: GoogleFonts.nunito(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kTextWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              _buildNextButton(widget.onNext),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}


const List<String> kAgeRanges = [
  'Under 18',
  '18–24',
  '25–34',
  '35–44',
  '45–54',
  '55–64',
  '65 or above',
];

class AgeScreen extends StatefulWidget {
  final VoidCallback onNext;
  const AgeScreen({super.key, required this.onNext});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildProgressBar(4),
              SizedBox(height: 32.h),
              Text(
                "How Old Are You?",
                style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: kTextWhite,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "This helps us personalize your learning experience.",
                style: GoogleFonts.nunito(
                  fontSize: 14.sp,
                  color: kTextGrey,
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView.separated(
                  itemCount: kAgeRanges.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? kPrimaryPurple.withOpacity(0.2)
                              : kCardColor,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? kSelectedBorder
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              kAgeRanges[index],
                              style: GoogleFonts.nunito(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: kTextWhite,
                              ),
                            ),
                            const Spacer(),
                            if (isSelected)
                              Icon(Icons.check_circle,
                                  color: kSelectedBorder, size: 22.sp),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              _buildNextButton(widget.onNext),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}


const List<Map<String, dynamic>> kPracticeOptions = [
  {'label': 'Casual', 'sub': '5 minutes / day', 'icon': '🌱'},
  {'label': 'Regular', 'sub': '10 minutes / day', 'icon': '⚡'},
  {'label': 'Serious', 'sub': '15 minutes / day', 'icon': '🔥'},
  {'label': 'Intense', 'sub': '20 minutes / day', 'icon': '🚀'},
];

class PracticeTimeScreen extends StatefulWidget {
  final VoidCallback onNext;
  const PracticeTimeScreen({super.key, required this.onNext});

  @override
  State<PracticeTimeScreen> createState() => _PracticeTimeScreenState();
}

class _PracticeTimeScreenState extends State<PracticeTimeScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildProgressBar(5),
              SizedBox(height: 32.h),
              Text(
                "How Much Time Do You Want to Practice?",
                style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: kTextWhite,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Set a daily goal and we'll remind you.",
                style: GoogleFonts.nunito(
                  fontSize: 14.sp,
                  color: kTextGrey,
                ),
              ),
              SizedBox(height: 32.h),
              ...List.generate(kPracticeOptions.length, (index) {
                final item = kPracticeOptions[index];
                final isSelected = _selectedIndex == index;
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 18.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? kPrimaryPurple.withOpacity(0.2)
                            : kCardColor,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isSelected
                              ? kSelectedBorder
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(item['icon'],
                              style: TextStyle(fontSize: 28.sp)),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['label'],
                                style: GoogleFonts.nunito(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: kTextWhite,
                                ),
                              ),
                              Text(
                                item['sub'],
                                style: GoogleFonts.nunito(
                                  fontSize: 13.sp,
                                  color: kTextGrey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          if (isSelected)
                            Icon(Icons.check_circle,
                                color: kSelectedBorder, size: 24.sp),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const Spacer(),
              _buildNextButton(widget.onNext),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}


class HearAboutElevateScreen extends StatefulWidget {
  final VoidCallback onNext;
  const HearAboutElevateScreen({super.key, required this.onNext});

  @override
  State<HearAboutElevateScreen> createState() =>
      _HearAboutElevateScreenState();
}

class _HearAboutElevateScreenState extends State<HearAboutElevateScreen> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildProgressBar(6),
              SizedBox(height: 32.h),
              Text(
                "How Did You Hear About Elevate?",
                style: GoogleFonts.nunito(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: kTextWhite,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: kHearAboutOptions.length,
                  itemBuilder: (context, index) {
                    final item = kHearAboutOptions[index];
                    final isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? kPrimaryPurple.withOpacity(0.2)
                              : kCardColor,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? kSelectedBorder
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(item['icon']!,
                                style: TextStyle(fontSize: 20.sp)),
                            SizedBox(width: 8.w),
                            Flexible(
                              child: Text(
                                item['label']!,
                                style: GoogleFonts.nunito(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kTextWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              _buildNextButton(widget.onNext),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}


class CourseOverviewScreen extends StatelessWidget {
  final VoidCallback onNext;
  const CourseOverviewScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildProgressBar(7),
              SizedBox(height: 32.h),
              Text(
                "Course Overview",
                style: GoogleFonts.nunito(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: kTextWhite,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Love learning, reading and writing and speaking",
                style: GoogleFonts.nunito(
                  fontSize: 14.sp,
                  color: kTextGrey,
                ),
              ),
              SizedBox(height: 24.h),

              // Course Content Card
              Text(
                "Course Content",
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: kTextWhite,
                ),
              ),
              SizedBox(height: 12.h),

              _buildCourseItem('📚', 'Vocabulary', '200+ words'),
              SizedBox(height: 10.h),
              _buildCourseItem('🗣️', 'Speaking', '50+ exercises'),
              SizedBox(height: 10.h),
              _buildCourseItem('✍️', 'Writing', '30+ lessons'),
              SizedBox(height: 10.h),
              _buildCourseItem('👂', 'Listening', '40+ audios'),
              SizedBox(height: 10.h),
              _buildCourseItem('📖', 'Reading', '25+ texts'),
              SizedBox(height: 10.h),
              _buildCourseItem('🧪', 'Grammar', '60+ rules'),

              const Spacer(),
              _buildNextButton(onNext, label: 'Start Learning!'),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseItem(String icon, String title, String sub) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text(icon, style: TextStyle(fontSize: 22.sp)),
          SizedBox(width: 14.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: kTextWhite,
                ),
              ),
              Text(
                sub,
                style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  color: kTextGrey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, color: kTextGrey, size: 16.sp),
        ],
      ),
    );
  }
}


class CongratulationsScreen extends StatelessWidget {
  final VoidCallback onContinue;
  const CongratulationsScreen({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),


              Container(
                width: 140.w,
                height: 140.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      kPrimaryPurple.withOpacity(0.4),
                      kAccentGreen.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text('🏆', style: TextStyle(fontSize: 70.sp)),
                ),
              ),
              SizedBox(height: 32.h),

              Text(
                'Congratulations!',
                style: GoogleFonts.nunito(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: kTextWhite,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "You're all set! Your personalized learning journey is ready. Let's start mastering your new language!",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 15.sp,
                  color: kTextGrey,
                  height: 1.5,
                ),
              ),

              const Spacer(),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                      (i) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Icon(Icons.star, color: Colors.amber, size: 28.sp),
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              _buildNextButton(onContinue, label: 'Continue'),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}


class AccountSetupFlow extends StatefulWidget {

  final VoidCallback onComplete;

  const AccountSetupFlow({super.key, required this.onComplete});

  @override
  State<AccountSetupFlow> createState() => _AccountSetupFlowState();
}

class _AccountSetupFlowState extends State<AccountSetupFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 8;

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
      setState(() => _currentPage++);
    } else {
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        NativeLanguageScreen(onNext: _nextPage),
        LearnLanguageScreen(onNext: _nextPage),
        HearAboutScreen(onNext: _nextPage),
        AgeScreen(onNext: _nextPage),
        PracticeTimeScreen(onNext: _nextPage),
        HearAboutElevateScreen(onNext: _nextPage),
        CourseOverviewScreen(onNext: _nextPage),
        CongratulationsScreen(onContinue: _nextPage),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}



Widget _buildProgressBar(int stepIndex, {int total = 8}) {
  return Row(
    children: List.generate(total, (i) {
      final filled = i < stepIndex;
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 4.h,
          decoration: BoxDecoration(
            color: filled ? kPrimaryPurple : kCardColor,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
      );
    }),
  );
}


Widget _buildNextButton(VoidCallback onTap, {String label = 'Next'}) {
  return SizedBox(
    width: double.infinity,
    height: 54.h,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: kButtonColor,
        foregroundColor: kTextWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        elevation: 0,
      ),
      child: Text(
        label,
        style: GoogleFonts.nunito(
          fontSize: 17.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
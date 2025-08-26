import 'package:demo_app/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  final int totalPages = 4;

  void goToNextPage() {
    if (currentPage < totalPages - 1) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLastPage() {
    _pageController.animateToPage(
      totalPages - 1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 12),
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              Image.asset(
                'lib/src/assets/text_logo.png',
                height: 22,
                width: 62,
              ),
              SizedBox(height: 21),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: 4,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/src/assets/onboard_one.png',
                                height: 374,
                                width: 374,
                              ),
                              Text(
                                'Welcome to the most tastiest app',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'You know, this app is edible meaning you\ncan eat it!',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF60655C),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      case 1:
                        return Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/src/assets/onboard_two.png',
                                  height: 374,
                                  width: 374,
                                ),
                                Text(
                                  'We use nitro on bicycles for delivery!',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'For very fast delivery we use nitro on bicycles, kidding, but we’re very fast.',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF60655C),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      case 2:
                        return Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/src/assets/onboard_three.png',
                                  height: 374,
                                  width: 374,
                                ),
                                Text(
                                  'Join to get the delicious quizines!',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'For very fast delivery we use nitro on bicycles, kidding, but we’re very fast.',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF60655C),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      case 3:
                        return Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/src/assets/onboard_four.png',
                                  height: 374,
                                  width: 374,
                                ),
                                Text(
                                  'Join to get the delicious quizines!',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      default:
                        return SizedBox.shrink();
                    }
                  },
                ),
              ),
              currentPage == totalPages - 1
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Your action
                            },
                            icon: Image.asset(
                              'lib/src/assets/apple_icon.png',
                              height: 24,
                              width: 24,
                            ),
                            label: Text(
                              'Continue with Apple',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff46890D),
                              minimumSize: Size(double.infinity, 52),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ), // Example padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'or',
                          style: TextStyle(
                            color: Color(0xff70756B),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(0, 52),
                                    backgroundColor: Color(0xffECF1E8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ), // optional
                                  ),
                                  child: Image.asset(
                                    'lib/src/assets/goggle_icon.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12), // spacing between buttons
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(0, 52),
                                    padding: EdgeInsets.zero,
                                    backgroundColor: Color(0xffECF1E8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Image.asset(
                                    'lib/src/assets/facebook_icon.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(0, 52),
                                    padding: EdgeInsets.zero,
                                    backgroundColor: Color(
                                      0xffECF1E8,
                                    ), // optional
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Image.asset(
                                    'lib/src/assets/email_icon.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    )
                  : Column(
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: 4,
                          effect: WormEffect(
                            dotHeight: 12,
                            dotWidth: 12,
                            activeDotColor: Color(0xff54A312),
                            dotColor: Color(0xffECF1E8),
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  skipToLastPage();
                                },
                                child: Text('Skip'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffECF1E8),
                                  foregroundColor: Color(0xff54A312),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  minimumSize: Size(98, 52),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    goToNextPage();
                                  },
                                  child: Text('Next'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff54A312),
                                    foregroundColor: Color(0xffECF1E8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    minimumSize: Size(229, 52),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ), // or some other widget for the else condition
            ],
          ),
        ),
      ),
    );
  }
}

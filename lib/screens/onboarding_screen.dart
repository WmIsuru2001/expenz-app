import 'package:expenz/constants/colors.dart';
import 'package:expenz/data/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/widgets/custum_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //page controller
  final PageController _controller = PageController();
  bool showDetailsPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3;
                    });
                  },
                  children: [
                    FrontPage(),
                    SharedOnboardingScreen(
                      title: OnBoardingData.onboardingDataList[0].title,
                      imagePath: OnBoardingData.onboardingDataList[0].imagePatg,
                      description:
                          OnBoardingData.onboardingDataList[0].description,
                    ),
                    SharedOnboardingScreen(
                      title: OnBoardingData.onboardingDataList[1].title,
                      imagePath: OnBoardingData.onboardingDataList[1].imagePatg,
                      description:
                          OnBoardingData.onboardingDataList[1].description,
                    ),
                    SharedOnboardingScreen(
                      title: OnBoardingData.onboardingDataList[2].title,
                      imagePath: OnBoardingData.onboardingDataList[2].imagePatg,
                      description:
                          OnBoardingData.onboardingDataList[2].description,
                    ),
                  ],
                ),
                //page dot indicator
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),
                //navigation button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !showDetailsPage
                        ? GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: CustumButton(
                              buttonName: showDetailsPage
                                  ? "Get Start"
                                  : "Next",
                              buttonColor: kMainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              //navigate to the user data screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDataScreen(),
                                ),
                              );
                            },
                            child: CustumButton(
                              buttonName: showDetailsPage
                                  ? "Get Start"
                                  : "Next",
                              buttonColor: kMainColor,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

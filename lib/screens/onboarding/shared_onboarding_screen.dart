import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  const SharedOnboardingScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultpadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 250, fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: kGrey,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:expenz/constants/colors.dart';
import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  const CustumButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: buttonColor,
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16,
            color: kWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

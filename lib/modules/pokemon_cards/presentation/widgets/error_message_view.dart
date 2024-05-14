import 'package:flutter/material.dart';

import 'package:pokedex_v2/global/constants/app_images.dart';
import 'package:pokedex_v2/global/constants/spacing.dart';

class ErrorMessageScreen extends StatelessWidget {
  const ErrorMessageScreen({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const VerticalSpacing(20),
        Image.asset(
          kNoInternet,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
        const VerticalSpacing(20),
        Text(
          errorMessage,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.02,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

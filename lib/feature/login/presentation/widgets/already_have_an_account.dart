import 'package:flutter/material.dart';

import '../../../../core/theming/app_text.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Already have an account yet?',
                      style:inter11w500()
                  ),
                  TextSpan(
                      text: ' ',
                      style: inter11w500()
                  ),
                  TextSpan(
                      text: 'Sign Up ',
                      style: inter11w600()
                  ),
                ])
        ),
      ],
    );
  }
}

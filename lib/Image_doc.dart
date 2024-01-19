import 'package:flutter/material.dart';

import 'core/theming/app_text.dart';

class ImageDoc extends StatelessWidget {
  const ImageDoc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.14, 0.4])),
          child: Image.asset("assets/images/Image.png")),
      Positioned(
        bottom: 30,
        right: 0,
        left: 0,
        child: Column(
          children: [
            Text(
              "       Best Doctor\n Appointment App",
              style: inter32w700(),
            ),

          ],
        ),
      )
    ]);
  }
}
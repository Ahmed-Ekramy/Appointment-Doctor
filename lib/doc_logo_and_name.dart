import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogoName extends StatelessWidget {
  const DocLogoName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svg/Frame.svg"),
        SizedBox(width: 10.w,),
        SvgPicture.asset("assets/svg/Docdoc.svg"),
      ],
    );
  }
}

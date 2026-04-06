import 'package:doc/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/responsive_size.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../manager/home_cubit.dart';
import 'filter_button.dart';

class SearchBarDoc extends StatelessWidget {
  const SearchBarDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 16.h),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              contentPadding: EdgeInsets.symmetric(vertical: 12.w),
              hintText: 'Search',
              prefixIcon: SvgPicture.asset(
                AppImages.search,
                color: AppColors.grey60,
                fit: BoxFit.scaleDown,
                height: 24.h,
                width: 24.w,
              ),
              borderRadius: 12,
              onChanged: (query) => HomeCubit.get(context).searchDoctors(query),
            ),
          ),
          SizedBox(width: 18.w),
          const FilterButton(),
        ],
      ),
    );
  }
}

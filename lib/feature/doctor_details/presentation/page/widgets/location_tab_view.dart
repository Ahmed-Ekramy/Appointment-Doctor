import 'package:flutter/material.dart';
import '../../../../../core/utils/responsive_size.dart';
import '../../../../../core/utils/text_style.dart';

class LocationTabView extends StatelessWidget {
  final String? address;
  final String? locationCity;
  final String? locationGovernorate;

  const LocationTabView({
    super.key,
    this.locationCity,
    this.locationGovernorate,
    this.address,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Practice Place',
            style: AppTextStyle.bold16(context),
          ),
          SizedBox(height: 12.h),
          Text(
            address ?? 'No address provided',
            style: AppTextStyle.regular14(context).copyWith(color: const Color(0xFF757575)),
          ),
          SizedBox(height: 4.h),
          Text(
            '${locationCity ?? ''}${locationCity != null && locationGovernorate != null ? ', ' : ''}${locationGovernorate ?? ''}',
            style: AppTextStyle.regular14(context).copyWith(color: const Color(0xFF9E9E9E)),
          ),
          SizedBox(height: 24.h),
          Text(
            'Location Map',
            style: AppTextStyle.bold16(context),
          ),
          SizedBox(height: 12.h),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: const Color(0xFFF5F5F5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // خريطة ثابتة كمثال (يمكن استبدالها بـ Google Maps لاحقاً)
                  Image.network(
                    'https://static-maps.yandex.ru/1.x/?lang=en_US&ll=31.2357,30.0444&z=14&l=map&size=600,300',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.map_outlined, size: 50, color: Colors.grey),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.location_on,
                      color: const Color(0xFF247CFF),
                      size: 40.sp,
                    ),
                  ),
                  Positioned(
                    bottom: 12.h,
                    right: 12.w,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // هنا يمكنك فتح خرائط جوجل الخارجية
                      },
                      icon: const Icon(Icons.directions, size: 18),
                      label: const Text('Directions'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF247CFF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

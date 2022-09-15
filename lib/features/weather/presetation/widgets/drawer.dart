import 'package:flutter/material.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/core/utils/app_string.dart';
import 'package:weather_app/core/utils/media_query_values.dart';
import 'package:weather_app/features/weather/presetation/widgets/widget_favourite_secation.dart';

import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/utils/assets_images_path.dart';
import '../../../../core/widgets/custom_text.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Spacer(),
                Icon(
                  Icons.settings,
                  color: AppColors.textWhite,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 30,
                color: AppColors.textWhite,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: AppString.favouriteLocation,
                fontWeight: FontWeight.w400,
                color: AppColors.textWhite,
              ),
              const Spacer(),
              Icon(
                Icons.info_outline_rounded,
                size: 30,
                color: AppColors.textWhite,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const FavWidget(),
          Container(
            margin: const EdgeInsets.all(10),
            height: 2,
            color: AppColors.lightGrey,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.add_location_outlined,
                size: 30,
                color: AppColors.textWhite,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: AppString.otherLocations,
                fontWeight: FontWeight.w400,
                color: AppColors.textWhite,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 20,
                color: AppColors.textWhite,
              ),
              const SizedBox(
                width: 2,
              ),
              CustomText(
                text: 'Cairo',
                fontWeight: FontWeight.w700,
                size: 20,
                color: AppColors.textWhite,
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                height: 40,
                width: 30,
                sunIcon,
              ),
              CustomText(
                text: '  33°',
                color: AppColors.textWhite,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRouts.searchScreen);
            },
            child: Container(
              height: context.height * 0.069,
              width: context.width * 0.5,
              decoration: BoxDecoration(
                color: AppColors.whiteWithOpacity,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: CustomText(
                  text: AppString.manageLocation,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 2,
            color: AppColors.lightGrey,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 30,
                color: AppColors.textWhite,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: AppString.reportWrongLocation,
                fontWeight: FontWeight.w400,
                color: AppColors.textWhite,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.support_agent_outlined,
                size: 30,
                color: AppColors.textWhite,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomText(
                text: AppString.contactUs,
                fontWeight: FontWeight.w400,
                color: AppColors.textWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

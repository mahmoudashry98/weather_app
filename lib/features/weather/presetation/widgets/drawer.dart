import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/core/utils/media_query_values.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';
import 'package:weather_app/features/weather/presetation/widgets/widget_favourite_secation.dart';

import '../../../../core/utils/assets_images_path.dart';
import '../../../../core/utils/enum.dart';
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
              children: const [
                Spacer(),
                Icon(Icons.settings),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Icon(
                Icons.star,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              CustomText(
                text: 'Favourite location',
                fontWeight: FontWeight.w400,
              ),
              Spacer(),
              Icon(
                Icons.info_outline_rounded,
                size: 30,
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
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Icon(
                Icons.add_location_outlined,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              CustomText(
                text: 'Other locations',
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                size: 20,
              ),
              const SizedBox(
                width: 2,
              ),
              const CustomText(
                text: 'Cairo',
                fontWeight: FontWeight.w700,
                size: 20,
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                height: 40,
                width: 30,
                sunIcon,
              ),
              const CustomText(
                text: '  33°',
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
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: CustomText(
                  text: 'Manage location',
                  fontWeight: FontWeight.w500,
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
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Icon(
                Icons.info_outline_rounded,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              CustomText(
                text: 'Report wrong location',
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Icon(
                Icons.support_agent_outlined,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              CustomText(
                text: 'Contact us',
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

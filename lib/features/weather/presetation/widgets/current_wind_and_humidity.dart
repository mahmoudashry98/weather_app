import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/app_string.dart';

import 'package:weather_app/core/utils/media_query_values.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/utils/assets_images_path.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/widgets/custom_text.dart';

class CurrentWindAndHumidity extends StatelessWidget {
  const CurrentWindAndHumidity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.weatherState) {
          case RequestState.loading:
            print('loading');
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return Container(
              decoration: BoxDecoration(
                color: AppColors.whiteWithOpacity,
                borderRadius: BorderRadius.circular(25),
              ),
              height: context.height * 0.18,
              width: context.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          sunIcon,
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: AppString.uvIndex,
                          size: 16,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: '${state.weatherEntities!.current.cloud}',
                          size: 14,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 120,
                      width: 2,
                      color: AppColors.lightGrey,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          windIcon,
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: AppString.upperwind,
                          size: 16,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text:
                              '${state.weatherEntities!.current.windKph} km/h',
                          size: 14,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 120,
                      width: 2,
                      color: AppColors.lightGrey,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          humidityIcon,
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: AppString.upperhumidity,
                          size: 16,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: '${state.weatherEntities!.current.humidity} %',
                          size: 14,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 200,
              child: Center(
                child: CustomText(
                  text: state.weathertMessage,
                ),
              ),
            );
        }
      },
    );
  }
}

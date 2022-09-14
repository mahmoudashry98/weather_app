import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/media_query_values.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/utils/assets_images_path.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/widgets/custom_text.dart';

class AstroWidget extends StatelessWidget {
  const AstroWidget({Key? key}) : super(key: key);

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
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(25),
              ),
              height: context.height * 0.25,
              width: context.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: 'Sunrise',
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: state.weatherEntities!.forecast.forecastday[0]
                              .astro.sunrise,
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          sunriseIcon,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: 'Sunset',
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: state.weatherEntities!.forecast.forecastday[0]
                              .astro.sunset,
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          sunsetIcon,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        )
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

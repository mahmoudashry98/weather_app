import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lottie/lottie.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/widgets/custom_text.dart';
import '../cubit/cubit.dart';

class CityTempWidget extends StatelessWidget {
  const CityTempWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.weatherState != current.weatherState,
      listener: (context, state) {
        // if (state.weatherState is ) {}
      },
      builder: (context, state) {
        switch (state.weatherState) {
          case RequestState.loading:
            print('loading');
            return const Center(child: CircularProgressIndicator());

          case RequestState.loaded:
            return Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text:
                              '${(state.weatherEntities!.current.tempC).toInt()}°',
                          size: 65,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                        LottieBuilder.network(
                          'https://assets1.lottiefiles.com/packages/lf20_jqfghjiz.json',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: state.weatherEntities!.location.country,
                          size: 35,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textBlack,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.location_on,
                          color: AppColors.textBlack,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text:
                          '${(state.weatherEntities!.current.tempC).toInt()} °/'
                          '${(state.weatherEntities!.forecast.forecastday[0].day.mintempC).toInt()}°'
                          'Feels like ${(state.weatherEntities!.current.feelslikeC).toInt()}°',
                      color: Colors.black54,
                      size: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    const CustomText(
                      text: 'Sat,7:45 pm',
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      size: 18,
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

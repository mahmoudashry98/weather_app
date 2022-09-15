import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/core/utils/media_query_values.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/utils/assets_images_path.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/widgets/custom_text.dart';

class TempAllHourInDay extends StatelessWidget {
  const TempAllHourInDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.weatherState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return Container(
              height: context.height * 0.25,
              width: context.width * 0.9,
              decoration: BoxDecoration(
                color: AppColors.whiteWithOpacity,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    state.weatherEntities!.forecast.forecastday[0].hour.length,
                itemBuilder: (context, index) {
                  var time = state.weatherEntities!.forecast.forecastday[0]
                      .hour[index].time;
                  var parsedTime = DateTime.parse(time);
                  var myTime = DateFormat('hh a').format(parsedTime);
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 25,
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: myTime,
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w500,
                              size: 18,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              crescentIcon,
                              height: 35,
                              width: 35,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text:
                                  '${(state.weatherEntities!.forecast.forecastday[0].hour[index].tempC).toInt()}°',
                              color: AppColors.textWhite,
                              fontWeight: FontWeight.w500,
                              size: 22,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  height: 30,
                                  width: 20,
                                  humidityIcon,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                CustomText(
                                  text:
                                      '${state.weatherEntities!.forecast.forecastday[0].hour[index].chanceOfRain}%',
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.textWhite,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
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

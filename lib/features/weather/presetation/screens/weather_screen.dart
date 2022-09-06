import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/utils/app_theme_colors.dart';
import 'package:weather_app/core/utils/media_query_values.dart';
import 'package:weather_app/core/widgets/custom_text.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

import '../../../../config/services/services_locator.dart';
import '../../../../core/utils/assets_images_path.dart';

class HomeWeatherscreen extends StatelessWidget {
  const HomeWeatherscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(sl())..getWeather(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            drawer: const Drawer(),
            appBar: AppBar(
              backgroundColor: Colors.grey[200],
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black,
                size: 30,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
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
                              const CustomText(
                                text: '23°',
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'El Fayoum',
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
                            height: 20,
                          ),
                          const CustomText(
                            text: '33° / 23° Feels like 30°',
                            color: Colors.black54,
                            size: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          const CustomText(
                            text: 'Sun, 8:01 Pm',
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: context.height * 0.26,
                    width: context.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  text: '8 Pm',
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w500,
                                  size: 18,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  crescentIcon,
                                  height: 35,
                                  width: 35,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: '23°',
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w500,
                                  size: 22,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      itemCount: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: context.height * 0.7,
                    width: context.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              CustomText(
                                text: 'Today',
                                color: AppColors.textBlack,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              CustomText(
                                text: '2%',
                                color: AppColors.textBlack,
                                fontWeight: FontWeight.w300,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                height: 50,
                                width: 40,
                                crescentIcon,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                height: 50,
                                width: 40,
                                crescentIcon,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: '33° 23°',
                                color: AppColors.textBlack,
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

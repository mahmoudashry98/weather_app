import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/utils/assets_images_path.dart';
import '../../../../core/widgets/custom_text.dart';

class FavWidget extends StatelessWidget {
  const FavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
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
              text: state.weatherEntities!.location.name,
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
            const SizedBox(
              width: 5,
            ),
            CustomText(
              text: '${(state.weatherEntities!.current.tempC).toInt()}°',
              color: AppColors.textWhite,
            ),
          ],
        );
      },
    );
  }
}

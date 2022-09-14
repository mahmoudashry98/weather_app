import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/core/utils/media_query_values.dart';
import 'package:weather_app/core/widgets/custom_text.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              centerTitle: true,
              title: const CustomText(
                text: 'Search',
                size: 22,
              ),
              iconTheme: const IconThemeData(
                size: 30,
              ),
              backgroundColor: Colors.grey[200],
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Container(
                    height: context.height * 0.07,
                    width: context.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          controller: AppCubit.get(context).searchController,
                          onSubmitted: (String text) {},
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Enter city name',
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 23,
                              vertical: 23,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () async {
                      await AppCubit.get(context).getForcastWeather();
                      print(AppCubit.get(context).searchController.text);
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, AppRouts.homeScreen);
                    },
                    child: Container(
                      height: context.height * 0.06,
                      width: context.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Search',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/core/widgets/custom_text.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';
import 'package:weather_app/features/weather/presetation/cubit/state.dart';


class CurrenLocation extends StatefulWidget {
  const CurrenLocation({Key? key}) : super(key: key);

  @override
  State<CurrenLocation> createState() => _CurrenLocationState();
}

class _CurrenLocationState extends State<CurrenLocation> {
  Location location = Location();
  bool? isServiceEnabled;
  PermissionStatus? permissionStatus;
  LocationData? locationData;
  bool isListrenLocation = false;
  bool isGetLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFEEEEEE)),
                  ),
                  onPressed: () async {
                    isServiceEnabled = await location.serviceEnabled();
                    if (!isServiceEnabled!) {
                      isServiceEnabled = await location.requestService();

                      if (isServiceEnabled!) return;
                    }
                    permissionStatus = await location.hasPermission();
                    if (permissionStatus == PermissionStatus.denied) {
                      permissionStatus = await location.requestPermission();

                      if (permissionStatus != PermissionStatus.granted) return;
                    }
                    locationData = await location.getLocation();

                    setState(() {
                      isGetLocation = true;
                      AppCubit.get(context).getDefaultForcastWeather(
                        locationData!.latitude,
                        locationData!.longitude,
                      );
                      print(locationData!.latitude);
                      print(locationData!.longitude);
                      Navigator.popAndPushNamed(context, AppRouts.homeScreen);
                    });
                  },
                  child: CustomText(text: 'Get current location'),
                ),
                isGetLocation
                    ? Text(
                        '${locationData!.latitude}/${locationData!.longitude}')
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/services/services_locator.dart';
import 'package:weather_app/features/weather/presetation/cubit/cubit.dart';

import 'bloc_observer.dart';
import 'config/routes/app_routes.dart';
import 'config/theme/theme_app.dart';

void main() {
  //change color in status screen
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        // navigation bar color
        statusBarColor: Colors.grey[300] // status bar color
        ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build main');
    return BlocProvider(
      create: (context) => AppCubit(sl(),sl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        routes: routes,
      ),
    );
  }
}

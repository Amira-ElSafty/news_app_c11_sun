import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_sun/home/home_screen.dart';
import 'package:flutter_app_news_c11_sun/my_bloc_observer.dart';
import 'package:flutter_app_news_c11_sun/my_theme_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
/*
500c5a4f9b244f3db92a47f436f1819e
 */
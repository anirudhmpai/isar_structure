import 'package:flutter/material.dart';
import 'package:isar_structure/providers/thought.dart';
import 'package:isar_structure/providers/user.dart';
import 'package:isar_structure/services/inject.dart';
import 'package:provider/provider.dart';
import 'modules/home/homeScreen/home_screen.dart';

main() async {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: serviceLocator.get<UserProvider>()),
        ChangeNotifierProvider.value(
            value: serviceLocator.get<ThoughtProvider>()),
      ],
      child: MaterialApp(
        title: 'Flutter Isar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

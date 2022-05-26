import 'package:chewata/home/index.dart';
import 'package:chewata/infrastructure/index.dart';
import 'package:chewata/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConnectionBloc()..add(Connect()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.landingRoute,
        routes: {
          Routes.landingRoute: (_) => const LandingPage(),
        },
      ),
    );
  }
}

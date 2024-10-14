import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/routing/app_route.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controller/read/read_cubit.dart';
import 'controller/write/write_cubit.dart';
import 'model/word.dart';
import 'core/helpers/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordAdapter());
  await Hive.openBox(Constants.hiveBoxName);

  runApp(
    MainApp(appRoute: AppRoute()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.appRoute});
  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ReadCubit()..getWords()),
        BlocProvider(create: (context) => WriteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute.getRoute,
      ),
    );
  }
}

import 'package:cubit_demo/view_model/view_model.dart';
import 'package:cubit_demo/views/Screens/home_screen.dart';
import 'package:flutter/material.dart';

globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
}

Future<void> main() async {
  await globalInitializer();
  BlocOverrides.runZoned(
    () {
      runApp(
        const MyApp(),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<CounterBlocBloc>(
          create: (context) => CounterBlocBloc(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: RouteGenerator.generateRoute,
        //   theme: MyTheme.lightTheme(context),
        //   darkTheme: MyTheme.darkTheme(context),
        home: HomeScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

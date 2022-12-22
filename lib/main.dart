import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/services/service_locator.dart';
import 'package:movies_clean_architecture/core/util/layout/home_layout.dart';
import 'package:movies_clean_architecture/core/util/observer.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/movies/presentation/screens/movie_screen.dart';



void main() async{
  ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>sl<MovieCubit>()..getNowPlayingMovie()..getPopularMovie(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const HomeLayout(),
      ),
    );
  }
}


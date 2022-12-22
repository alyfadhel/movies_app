import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/util/layout/cubit/state.dart';
import 'package:movies_clean_architecture/features/movies/presentation/screens/movie_screen.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/screens/tv_screen.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates>
{
  HomeLayoutCubit(): super(InitialHomeLayoutState());

  static HomeLayoutCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem>items =
  [
      const BottomNavigationBarItem(
      icon: Icon(
        Icons.movie_creation_outlined,
        color:  Colors.white,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.tv_outlined,
        color: Colors.white,
      ),
      label: '',
    ),
  ];

  List<Widget>screens =
  [
    const MoviesScreen(),
    const TvScreen(),
  ];

  void changeBottomNav(int index)
  {
    currentIndex = index ;
    emit(ChangeBottomNav());
  }

}
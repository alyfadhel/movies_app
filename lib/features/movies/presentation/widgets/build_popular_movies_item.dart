import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/util/constance.dart';
import 'package:movies_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/state.dart';

class BuildPopularMovies extends StatelessWidget {
 final Movie movie ;
  const BuildPopularMovies({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit,MovieStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200.0,
            height: 500.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  AppConstance.imageUrl(movie.backdropPath),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

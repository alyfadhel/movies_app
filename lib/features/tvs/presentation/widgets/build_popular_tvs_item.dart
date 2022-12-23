import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/util/constance.dart';
import 'package:movies_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/state.dart';
import 'package:movies_clean_architecture/features/tvs/domain/entities/tvs.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/states.dart';

class BuildPopularTvs extends StatelessWidget {
 final Tvs tvs ;
  const BuildPopularTvs({Key? key,required this.tvs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvsCubit,TvsStates>(
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
                  AppConstance.imageUrl(tvs.posterPath),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

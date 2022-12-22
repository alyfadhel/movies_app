import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/services/service_locator.dart';
import 'package:movies_clean_architecture/core/util/constance.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/state.dart';
import 'package:movies_clean_architecture/features/movies/presentation/widgets/build_now_playing_movies_item.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      const [
        BuildNowPlayingMovies(),
      ],
    );
  }
}

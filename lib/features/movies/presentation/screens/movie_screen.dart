import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/services/service_locator.dart';
import 'package:movies_clean_architecture/core/util/constance.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/state.dart';
import 'package:movies_clean_architecture/features/movies/presentation/widgets/build_now_playing_movies_item.dart';
import 'package:movies_clean_architecture/features/movies/presentation/widgets/build_popular_movies_item.dart';
import 'package:movies_clean_architecture/features/movies/presentation/widgets/build_top_rated_movies_item.dart';
import 'package:movies_clean_architecture/features/movies/presentation/widgets/build_up_coming_movies_item.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MovieCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ConditionalBuilder(
                  condition: state is! GetNowPlayingMoviesLoadingState,
                  builder: (context) => const BuildNowPlayingMovies(),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Popular',
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: MaterialButton(
                        onPressed: (){},
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Text(
                              'See More',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => BuildPopularMovies(movie: cubit.movie[index]),
                  itemCount: MovieCubit.get(context).movie.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Top Rated',
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: MaterialButton(
                        onPressed: (){},
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Text(
                              'See More',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              SizedBox(
                height: 300.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => BuildTopRatedMovies(movie: cubit.movie[index]),
                  itemCount: MovieCubit.get(context).movie.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Upcoming',
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: MaterialButton(
                        onPressed: (){},
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Text(
                              'See More',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              SizedBox(
                height: 300.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => BuildUpComingMovies(movie: cubit.movie[index]),
                  itemCount: MovieCubit.get(context).movie.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


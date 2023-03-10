import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/util/constance.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/states.dart';

class BuildOnTheAir extends StatelessWidget {
  const BuildOnTheAir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvsCubit,TvsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = TvsCubit.get(context);
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            items: cubit.tvs.map(
                  (item) {
                return GestureDetector(
                  key: const Key('openMovieMinimalDetail'),
                  onTap: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    // builder: (context) => MovieDetailScreen(id: item.id),),);
                  },
                  child: Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              // fromLTRB
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0, 0.3, 0.5, 1],
                          ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          height: 560.0,
                          width: double.infinity,
                          imageUrl:
                          AppConstance.imageUrl(item.posterPath),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.redAccent,
                                    size: 16.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    'Now Playing'.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                item.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}

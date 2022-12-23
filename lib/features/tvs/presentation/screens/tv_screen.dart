import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/states.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/widgets/build_on_the_air.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/widgets/build_popular_tvs_item.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/widgets/build_top_rated_tvs_item.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TvsCubit,TvsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = TvsCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ConditionalBuilder(
                condition: state is! GetOnTheAirTvsLoadingState,
                builder: (context) => const BuildOnTheAir(),
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
                  itemBuilder: (context, index) => BuildPopularTvs(tvs: cubit.tvs[index]),
                  itemCount: cubit.tvs.length,
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
                  itemBuilder: (context, index) => BuildTopRatedTvs(tvs: cubit.tvs[index]),
                  itemCount: cubit.tvs.length,
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

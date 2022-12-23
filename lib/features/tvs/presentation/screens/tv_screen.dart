import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/states.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/widgets/build_on_the_air.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TvsCubit,TvsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = TvsCubit.get(context);
        return Column(
          children: [
            ConditionalBuilder(
              condition: state is! GetOnTheAirTvsLoadingState,
              builder: (context) => const BuildOnTheAir(),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        );
      },

    );
  }
}

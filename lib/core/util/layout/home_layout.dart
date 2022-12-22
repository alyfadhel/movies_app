import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/util/layout/cubit/cubit.dart';
import 'package:movies_clean_architecture/core/util/layout/cubit/state.dart';
import 'package:hexcolor/hexcolor.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);
          return Scaffold(
            backgroundColor: HexColor('333739'),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: HexColor('333739'),
                items: cubit.items,
              onTap: (index)
              {
                cubit.changeBottomNav(index);
              },
              currentIndex: cubit.currentIndex,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/usecase/bas_usecase.dart';
import 'package:movies_clean_architecture/features/tvs/domain/entities/tvs.dart';
import 'package:movies_clean_architecture/features/tvs/domain/usecase/get_on_the_air_use_case.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/states.dart';

class TvsCubit extends Cubit<TvsStates> {
  List<Tvs> tvs = [];
  final GetOnTheAirUseCase getOnTheAirUseCase;

  TvsCubit(
    this.getOnTheAirUseCase,
  ) : super(InitialTvsState());

  static TvsCubit get(context) => BlocProvider.of(context);

  void getOnTheAir() async {
    emit(GetOnTheAirTvsLoadingState());
    final result = await getOnTheAirUseCase(const NoParameters());

    result.fold(
      (l) => emit(GetOnTheAirTvsErrorState(l.message)),
      (r) {
        tvs = r;
        emit(GetOnTheAirTvsSuccessState(r));
      },
    );
  }
}

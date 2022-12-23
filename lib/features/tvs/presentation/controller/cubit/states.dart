import 'package:movies_clean_architecture/features/tvs/domain/entities/tvs.dart';

abstract class TvsStates{}

class InitialTvsState extends TvsStates{}

class GetOnTheAirTvsLoadingState extends TvsStates{}
class GetOnTheAirTvsSuccessState extends TvsStates
{
  final List<Tvs>tvs;

  GetOnTheAirTvsSuccessState(this.tvs);
}
class GetOnTheAirTvsErrorState extends TvsStates
{
  final String error;

  GetOnTheAirTvsErrorState(this.error);
}
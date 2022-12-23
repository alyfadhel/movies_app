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

//////////////////////////////////////////////////////////

class GetPopularTvsSuccessState extends TvsStates
{
  final List<Tvs>tvs;

  GetPopularTvsSuccessState(this.tvs);
}
class GetPopularTvsErrorState extends TvsStates
{
  final String error;

  GetPopularTvsErrorState(this.error);
}

/////////////////////////////////////////////////////////////

class GetTopRatedTvsSuccessState extends TvsStates
{
  final List<Tvs>tvs;

  GetTopRatedTvsSuccessState(this.tvs);
}
class GetTopRatedTvsErrorState extends TvsStates
{
  final String error;

  GetTopRatedTvsErrorState(this.error);
}

//////////////////////////////////////////////////////////////
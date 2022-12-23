import 'package:dio/dio.dart';
import 'package:movies_clean_architecture/core/error/exceptions.dart';
import 'package:movies_clean_architecture/core/network/error_message_model.dart';
import 'package:movies_clean_architecture/core/util/constance.dart';
import 'package:movies_clean_architecture/features/tvs/data/model/tvs_model.dart';

abstract class BaseTvsRemoteDataSource
{
  Future<List<TvsModel>>getOnTheAir();
}

class TvsRemoteDataSource extends BaseTvsRemoteDataSource
{
  @override
  Future<List<TvsModel>> getOnTheAir() async{
    final response = await Dio().get(AppConstance.onTheAirTvsPath);
    if(response.statusCode == 200 ){
      return List<TvsModel>.from((response.data['results']as List)
        .map((e) => TvsModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}
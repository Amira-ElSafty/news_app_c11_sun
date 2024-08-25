import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/source_data_source.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/source_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceOfflineDataSource offlineDataSource;

  SourceRepositoryImpl(
      {required this.remoteDataSource, required this.offlineDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    //todo: internet => remote
    var checkResult = await Connectivity().checkConnectivity();
    if (checkResult == ConnectivityResult.wifi ||
        checkResult == ConnectivityResult.mobile) {
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      offlineDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    } else {
      //todo: no internet => offline
      var sourceResponse = await offlineDataSource.getSources(categoryId);
      return sourceResponse;
    }
  }
}

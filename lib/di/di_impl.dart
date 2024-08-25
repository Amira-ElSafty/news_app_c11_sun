// //todo: vieModel => object Repository
// // todo: Repository => object dataSource
// // todo: dataSource => object apiManager
//
// import 'package:flutter_app_news_c11_sun/api/api_manager.dart';
// import 'package:flutter_app_news_c11_sun/repository/news/dataSource/news_remote_data_source.dart';
// import 'package:flutter_app_news_c11_sun/repository/news/news_data_source.dart';
// import 'package:flutter_app_news_c11_sun/repository/news/news_repository.dart';
// import 'package:flutter_app_news_c11_sun/repository/news/repository/news_repository_impl.dart';
// import 'package:flutter_app_news_c11_sun/repository/sources/dataSource/source_offline_data_source_impl.dart';
// import 'package:flutter_app_news_c11_sun/repository/sources/dataSource/source_remote_data_source_impl.dart';
// import 'package:flutter_app_news_c11_sun/repository/sources/repository/source_repository_impl.dart';
// import 'package:flutter_app_news_c11_sun/repository/sources/source_data_source.dart';
// import 'package:flutter_app_news_c11_sun/repository/sources/source_repository.dart';
//
// SourceRepository injectSourceRepository() {
//   return SourceRepositoryImpl(
//       remoteDataSource: injectSourceRemoteDataSource(),
//       offlineDataSource: injectSourceOfflineDataSource());
// }
//
// SourceRemoteDataSource injectSourceRemoteDataSource() {
//   return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }
//
// SourceOfflineDataSource injectSourceOfflineDataSource() {
//   return SourceOfflineDataSourceImpl();
// }
//
// NewsRepository injectNewsRepository() {
//   return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
// }
//
// NewsRemoteDataSource injectNewsRemoteDataSource() {
//   return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }

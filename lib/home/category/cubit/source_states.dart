import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';

abstract class SourceState {} // parent

class SourceInitialState extends SourceState {}

class SourceLoadingState extends SourceState {}

class SourceErrorState extends SourceState {
  String errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends SourceState {
  List<Source> sourcesList;

  SourceSuccessState({required this.sourcesList});
}

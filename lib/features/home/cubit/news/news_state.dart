part of 'news_cubit.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<NewsModel> newsResponse;
  NewsSuccess(this.newsResponse);
}

final class NewsFailure extends NewsState {
  final String message;
  NewsFailure(this.message);
}

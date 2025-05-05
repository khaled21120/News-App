import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:news/core/utils/helper.dart';
import 'package:news/features/home/data/repo/news_repo.dart';

import '../../../../core/errors/error.dart';
import '../../../../core/services/api_service.dart';
import '../model/news_model.dart';

class NewsRepoImpl extends NewsRepo {
  final ApiService apiService;

  NewsRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<NewsModel>>> fetchNews() async {
    final date = DateFormat(
      'yyyy-MM-dd',
    ).format(DateTime.now().subtract(const Duration(days: 1)));
    final endPoint = Helper.topNewsEndPoint(
      date: date,
      lang: 'ar',
      country: 'eg',
    );

    try {
      final res = await apiService.getMapData(endPoint: endPoint);
      final allNewsJson =
          (res['top_news'] as List)
              .expand((section) => section['news'] as List)
              .toList();

      final newsList = allNewsJson.map((e) => NewsModel.fromJson(e)).toList();

      return Right(newsList);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}

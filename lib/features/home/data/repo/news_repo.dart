import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../model/news_model.dart';

abstract class NewsRepo {
  Future<Either<Failures, List<NewsModel>>> fetchNews();
}

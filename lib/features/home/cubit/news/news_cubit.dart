import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/home/data/repo/news_repo.dart';

import '../../data/model/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsRepo) : super(NewsInitial());
  final NewsRepo newsRepo;

  Future<void> fetchNews() async {
    emit(NewsLoading());
    final res = await newsRepo.fetchNews();
    res.fold((l) => emit(NewsFailure(l.errMsg)), (r) => emit(NewsSuccess(r)));
  }
}

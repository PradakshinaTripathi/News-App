import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'news_repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  // NewsCubit() : super(NewsInitial());

  final NewsService service;

  NewsCubit({required this.service}) :  super(NewsInitial());

  void fetchNews() async{
    emit(NewsLoading());
    try {
      final articles = await service.fetchData();
      emit(NewsLoaded(articles));
      print('RESPONSE :::: $articles');
    } catch (e) {
      emit(NewsError('Failed to load news: $e'));
    }
  }

}

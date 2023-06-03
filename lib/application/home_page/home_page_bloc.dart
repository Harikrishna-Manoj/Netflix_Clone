import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/core/hotandNew/hot_and_new_services.dart';
import '../../domain/core/hotandNew/model/hot_and_new_resp.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

@injectable
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HotAndNewService _homeService;

  HomePageBloc(this._homeService) : super(HomePageState.initial()) {
    /*
     on event get homescren data
     */
    on<GetHomeScreenData>((event, emit) async {
      // send loading to ui
      emit(state.copyWith(isLoading: true, hasError: false));

      //get data
      final movieResult = await _homeService.getHotAndNewMovieData();
      final tvResult = await _homeService.getHotAndNewTvData();
      //transform data
      final state1 = movieResult.fold(
        (MainFailure failure) {
          return HomePageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;

          return HomePageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear!,
            trendingMovieList: trending!,
            tenseMovieList: dramas!,
            southIndianMovieList: southIndian!,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(state1);
      final state2 = tvResult.fold(
        (MainFailure failure) {
          return HomePageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          final top10List = resp.results;
          return HomePageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tenseMovieList: state.tenseMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List!,
            isLoading: false,
            hasError: false,
          );
        },
      );

      //send to  ui
      emit(state2);
    });
  }
}

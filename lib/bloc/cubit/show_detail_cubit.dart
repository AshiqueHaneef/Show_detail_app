import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_detail_app/data/repository.dart';
import 'package:show_detail_app/models/show_detail.dart';

part 'show_detail_state.dart';

class ShowDetailCubit extends Cubit<ShowDetailState> {
  ShowDetailCubit() : super(ShowDetailInitial());

  Future<void> getShows() async {
    try {
      emit(ShowDetailsLoading());
      final data = await Repository.fetchShowDetail();
      emit(ShowDetailsLoaded(data));
    } catch (e) {
      emit(ShowDetailsFailed());
    }
  }
}

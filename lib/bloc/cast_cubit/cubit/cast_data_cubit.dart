import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_detail_app/data/repository.dart';

import '../../../models/cast.dart';

part 'cast_data_state.dart';

class CastDataCubit extends Cubit<CastDataState> {
  CastDataCubit() : super(CastDataInitial());

  Future<void> getCast(String id) async {
    try {
      emit(CastDataLoading());
      final data = await Repository.fetchCast(id);
      emit(CastDataLoaded(data));
    } catch (e) {
      emit(CastDataFailed());
    }
  }
}

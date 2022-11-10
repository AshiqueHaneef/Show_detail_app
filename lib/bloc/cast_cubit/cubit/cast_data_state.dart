part of 'cast_data_cubit.dart';

abstract class CastDataState extends Equatable {
  const CastDataState();

  @override
  List<Object> get props => [];
}

class CastDataInitial extends CastDataState {}

class CastDataLoaded extends CastDataState {
  final List<Cast> castList;
  const CastDataLoaded(this.castList);
  @override
  // TODO: implement props
  List<Object> get props => [castList.length];
}

class CastDataLoading extends CastDataState {}

class CastDataFailed extends CastDataState {}

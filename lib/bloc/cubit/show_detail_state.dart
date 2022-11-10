part of 'show_detail_cubit.dart';

abstract class ShowDetailState extends Equatable {
  const ShowDetailState();

  @override
  List<Object> get props => [];
}

class ShowDetailInitial extends ShowDetailState {}

class ShowDetailsLoaded extends ShowDetailState {
  final List<ShowDetail> showList;
  const ShowDetailsLoaded(this.showList);
  @override
  // TODO: implement props
  List<Object> get props => [showList.length];
}

class ShowDetailsLoading extends ShowDetailState {}

class ShowDetailsFailed extends ShowDetailState {}

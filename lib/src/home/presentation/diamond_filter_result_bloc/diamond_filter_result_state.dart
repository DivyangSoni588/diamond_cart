part of 'diamond_filter_result_bloc.dart';

abstract class DiamondFilterResultState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DiamondFilterResultInitial extends DiamondFilterResultState {}

class DiamondFilterResultLoading extends DiamondFilterResultState {}

class DiamondFilterResultLoaded extends DiamondFilterResultState {
  final List<Diamonds> diamonds;

  DiamondFilterResultLoaded(this.diamonds);

  @override
  List<Object?> get props => [diamonds];
}

class DiamondFilterResultError extends DiamondFilterResultState {
  final String message;

  DiamondFilterResultError(this.message);

  @override
  List<Object?> get props => [message];
}

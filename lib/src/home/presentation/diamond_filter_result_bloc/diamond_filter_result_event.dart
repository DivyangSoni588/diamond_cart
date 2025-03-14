part of 'diamond_filter_result_bloc.dart';

abstract class DiamondFilterResultEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ApplyDiamondFilter extends DiamondFilterResultEvent {
  final DiamondFilterEntity diamondFilterEntity;

  ApplyDiamondFilter(this.diamondFilterEntity);

  @override
  List<Object?> get props => [diamondFilterEntity];
}

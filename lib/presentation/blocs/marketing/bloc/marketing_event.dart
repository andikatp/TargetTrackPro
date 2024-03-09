part of 'marketing_bloc.dart';

sealed class MarketingEvent extends Equatable {
  const MarketingEvent();

  @override
  List<Object> get props => [];
}

class GetMarketingTargetEvent extends MarketingEvent {
  const GetMarketingTargetEvent();
}

class SaveMarketingTargetEvent extends MarketingEvent {
  const SaveMarketingTargetEvent({required this.target});
  final Target target;

  @override
  List<Object> get props => [target];
}

class DeleteMarketingTargetEvent extends MarketingEvent {
  const DeleteMarketingTargetEvent({required this.target});
  final Target target;

  @override
  List<Object> get props => [target];
}

class EditMarketingTargetEvent extends MarketingEvent {
  const EditMarketingTargetEvent({required this.target});
  final Target target;

  @override
  List<Object> get props => [target];
}

part of 'business_bloc.dart';

sealed class BusinessEvent extends Equatable {
  const BusinessEvent();

  @override
  List<Object> get props => [];
}

class GetBusinessTargetEvent extends BusinessEvent {
  const GetBusinessTargetEvent();
}

class SaveBusinessTargetEvent extends BusinessEvent {
  const SaveBusinessTargetEvent({required this.target});
  final Target target;

  @override
  List<Object> get props => [target];
}

class DeleteBusinessTargetEvent extends BusinessEvent {
  const DeleteBusinessTargetEvent({required this.target});
  final Target target;

  @override
  List<Object> get props => [target];
}

class EditBusinessTargetEvent extends BusinessEvent {
  const EditBusinessTargetEvent({required this.target});
  final Target target;

  @override
  List<Object> get props => [target];
}

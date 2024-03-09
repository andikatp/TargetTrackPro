part of 'business_bloc.dart';

enum BusinessStatus { initial, loading, success, error }

class BusinessState extends Equatable {
  const BusinessState({
     this.status = BusinessStatus.initial,
     this.targets = const [],
     this.errorMessage = '',
  });

  final BusinessStatus status;
  final List<Target> targets;
  final String errorMessage;

  BusinessState copyWith({
    BusinessStatus? status,
    List<Target>? targets,
    String? errorMessage,
  }) {
    return BusinessState(
      status: status ?? this.status,
      targets: targets ?? this.targets,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, targets, errorMessage];
}

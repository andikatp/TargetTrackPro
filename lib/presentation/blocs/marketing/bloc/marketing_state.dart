part of 'marketing_bloc.dart';

enum MarketingStatus { initial, loading, success, error }


class MarketingState extends Equatable {
  const MarketingState({
     this.status = MarketingStatus.initial,
     this.targets = const [],
     this.errorMessage = '',
  });

  final MarketingStatus status;
  final List<Target> targets;
  final String errorMessage;

  MarketingState copyWith({
    MarketingStatus? status,
    List<Target>? targets,
    String? errorMessage,
  }) {
    return MarketingState(
      status: status ?? this.status,
      targets: targets ?? this.targets,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, targets, errorMessage];
}

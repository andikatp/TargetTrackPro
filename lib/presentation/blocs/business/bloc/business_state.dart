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


// sealed class BusinessState extends Equatable {
//   const BusinessState();

//   @override
//   List<Object> get props => [];
// }

// final class BusinessInitial extends BusinessState {
//   const BusinessInitial();
// }

// final class BusinessLoading extends BusinessState {
//   const BusinessLoading();
// }

// final class BusinessTargetsLoaded extends BusinessState {
//   const BusinessTargetsLoaded({required this.targets});
//   final List<Target> targets;

//   @override
//   List<Object> get props => [targets];
// }

// final class BusinessTargetsError extends BusinessState {
//   const BusinessTargetsError({required this.message});
//   final String message;

//   @override
//   List<Object> get props => [message];
// }

// final class BusinessDone extends BusinessState {
//   const BusinessDone();
// }

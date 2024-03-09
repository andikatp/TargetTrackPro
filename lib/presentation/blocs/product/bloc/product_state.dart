part of 'product_bloc.dart';

enum ProductStatus { initial, loading, success, error }

class ProductState extends Equatable {
  const ProductState({
     this.status = ProductStatus.initial,
     this.targets = const [],
     this.errorMessage = '',
  });

  final ProductStatus status;
  final List<Target> targets;
  final String errorMessage;

  ProductState copyWith({
    ProductStatus? status,
    List<Target>? targets,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      targets: targets ?? this.targets,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, targets, errorMessage];
}


// sealed class ProductState extends Equatable {
//   const ProductState();

//   @override
//   List<Object> get props => [];
// }

// final class ProductInitial extends ProductState {
//   const ProductInitial();
// }

// final class ProductLoading extends ProductState {
//   const ProductLoading();
// }

// final class ProductTargetsLoaded extends ProductState {
//   const ProductTargetsLoaded({required this.targets});
//   final List<Target> targets;

//   @override
//   List<Object> get props => [targets];
// }

// final class ProductTargetsError extends ProductState {
//   const ProductTargetsError({required this.message});
//   final String message;

//   @override
//   List<Object> get props => [message];
// }

// final class ProductDone extends ProductState {
//   const ProductDone();
// }

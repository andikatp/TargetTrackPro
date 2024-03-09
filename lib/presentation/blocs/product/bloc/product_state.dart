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

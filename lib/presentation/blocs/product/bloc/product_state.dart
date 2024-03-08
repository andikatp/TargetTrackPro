part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {
  const ProductInitial();
}

final class ProductLoading extends ProductState {
  const ProductLoading();
}

final class ProductTargetsLoaded extends ProductState {
  const ProductTargetsLoaded({required this.targets});
  final List<Target> targets;

  @override
  List<Object> get props => [targets];
}

final class ProductTargetsError extends ProductState {
  const ProductTargetsError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class ProductDone extends ProductState {
  const ProductDone();
}

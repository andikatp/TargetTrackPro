part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductTargetEvent extends ProductEvent {
  const GetProductTargetEvent();
}

class SaveProductTargetEvent extends ProductEvent {
  const SaveProductTargetEvent({required this.target});
  final Target target;

  @override
  List<Object> get props => [target];
}

class DeleteProductTargetEvent extends ProductEvent {
  const DeleteProductTargetEvent({required this.target});
  final Target target;

  @override
  List<Object> get props => [target];
}

class EditProductTargetEvent extends ProductEvent {
  const EditProductTargetEvent({required this.target});
  final Target target;

  @override
  List<Object> get props => [target];
}

import 'package:business/domain/usecases/product/delete_product_target.dart';
import 'package:business/domain/usecases/product/edit_product_target.dart';
import 'package:business/domain/usecases/product/get_product_targets.dart';
import 'package:business/domain/usecases/product/save_product_target.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required GetProductTargets getProductTargets,
    required SaveProductTarget saveProductTarget,
    required EditProductTarget editProductTarget,
    required DeleteProductTarget deleteProductTarget,
  })  : _getProductTargets = getProductTargets,
        _saveProductTarget = saveProductTarget,
        _editProductTarget = editProductTarget,
        _deleteProductTarget = deleteProductTarget,
        super(ProductInitial()) {
    on<ProductEvent>((event, emit) => emit(ProductInitial()));
  }

  final GetProductTargets _getProductTargets;
  final SaveProductTarget _saveProductTarget;
  final EditProductTarget _editProductTarget;
  final DeleteProductTarget _deleteProductTarget;
}

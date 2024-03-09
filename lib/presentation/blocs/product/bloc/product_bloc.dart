import 'package:business/domain/entities/core/target.dart';
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
        super(const ProductState()) {
    on<ProductEvent>((event, emit) => emit(state));
    on<GetProductTargetEvent>(_getProductTargetsHandler);
    on<SaveProductTargetEvent>(_saveProductTargetsHandler);
    on<EditProductTargetEvent>(_editProductTargetsHandler);
    on<DeleteProductTargetEvent>(_deleteProductTargetsHandler);
  }

  final GetProductTargets _getProductTargets;
  final SaveProductTarget _saveProductTarget;
  final EditProductTarget _editProductTarget;
  final DeleteProductTarget _deleteProductTarget;

  Future<void> _getProductTargetsHandler(
    GetProductTargetEvent event,
    Emitter<ProductState> emit,
  ) async {
    final result = await _getProductTargets();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (targets) =>
          emit(state.copyWith(status: ProductStatus.success, targets: targets)),
    );
  }

  Future<void> _saveProductTargetsHandler(
    SaveProductTargetEvent event,
    Emitter<ProductState> emit,
  ) async {
    final result = await _saveProductTarget(event.target);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (_) {
        final updatedTargets = List.of(state.targets)..add(event.target);
        emit(
          state.copyWith(
            status: ProductStatus.success,
            targets: updatedTargets,
          ),
        );
      },
    );
  }

  Future<void> _editProductTargetsHandler(
    EditProductTargetEvent event,
    Emitter<ProductState> emit,
  ) async {
    final result = await _editProductTarget(event.target);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (_) {
        final updatedTargets = state.targets
            .map(
              (target) => target.id == event.target.id ? event.target : target,
            )
            .toList();
        emit(
          state.copyWith(
            status: ProductStatus.success,
            targets: updatedTargets,
          ),
        );
      },
    );
  }

  Future<void> _deleteProductTargetsHandler(
    DeleteProductTargetEvent event,
    Emitter<ProductState> emit,
  ) async {
    final result = await _deleteProductTarget(event.target);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (_) => emit(
        state.copyWith(
          status: ProductStatus.success,
          targets: state.targets
              .where((target) => target.id != event.target.id)
              .toList(),
        ),
      ),
    );
  }
}

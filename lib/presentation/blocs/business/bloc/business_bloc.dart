import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/usecases/Business/delete_Business_target.dart';
import 'package:business/domain/usecases/Business/edit_Business_target.dart';
import 'package:business/domain/usecases/Business/get_Business_targets.dart';
import 'package:business/domain/usecases/Business/save_Business_target.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  BusinessBloc({
    required GetBusinessTargets getBusinessTargets,
    required SaveBusinessTarget saveBusinessTarget,
    required EditBusinessTarget editBusinessTarget,
    required DeleteBusinessTarget deleteBusinessTarget,
  })  : _getBusinessTargets = getBusinessTargets,
        _saveBusinessTarget = saveBusinessTarget,
        _editBusinessTarget = editBusinessTarget,
        _deleteBusinessTarget = deleteBusinessTarget,
        super(const BusinessState()) {
    on<BusinessEvent>((event, emit) => emit(state));
    on<GetBusinessTargetEvent>(_getBusinessTargetsHandler);
    on<SaveBusinessTargetEvent>(_saveBusinessTargetsHandler);
    on<EditBusinessTargetEvent>(_editBusinessTargetsHandler);
    on<DeleteBusinessTargetEvent>(_deleteBusinessTargetsHandler);
  }

  final GetBusinessTargets _getBusinessTargets;
  final SaveBusinessTarget _saveBusinessTarget;
  final EditBusinessTarget _editBusinessTarget;
  final DeleteBusinessTarget _deleteBusinessTarget;

  Future<void> _getBusinessTargetsHandler(
    GetBusinessTargetEvent event,
    Emitter<BusinessState> emit,
  ) async {
    final result = await _getBusinessTargets();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: BusinessStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (targets) => emit(
        state.copyWith(
          status: BusinessStatus.success,
          targets: targets,
        ),
      ),
    );
  }

  Future<void> _saveBusinessTargetsHandler(
    SaveBusinessTargetEvent event,
    Emitter<BusinessState> emit,
  ) async {
    final result = await _saveBusinessTarget(event.target);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: BusinessStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (_) {
        final updatedTargets = List.of(state.targets)..add(event.target);
        emit(
          state.copyWith(
            status: BusinessStatus.success,
            targets: updatedTargets,
          ),
        );
      },
    );
  }

  Future<void> _editBusinessTargetsHandler(
    EditBusinessTargetEvent event,
    Emitter<BusinessState> emit,
  ) async {
    final result = await _editBusinessTarget(event.target);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: BusinessStatus.error,
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
            status: BusinessStatus.success,
            targets: updatedTargets,
          ),
        );
      },
    );
  }

  Future<void> _deleteBusinessTargetsHandler(
    DeleteBusinessTargetEvent event,
    Emitter<BusinessState> emit,
  ) async {
    final result = await _deleteBusinessTarget(event.target);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: BusinessStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (_) => emit(
        state.copyWith(
          status: BusinessStatus.success,
          targets: state.targets
              .where((target) => target.id != event.target.id)
              .toList(),
        ),
      ),
    );
  }
}

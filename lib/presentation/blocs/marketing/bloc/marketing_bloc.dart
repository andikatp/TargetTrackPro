import 'package:business/domain/entities/core/target.dart';
import 'package:business/domain/usecases/marketing/delete_marketing_target.dart';
import 'package:business/domain/usecases/marketing/edit_marketing_target.dart';
import 'package:business/domain/usecases/marketing/get_marketing_targets.dart';
import 'package:business/domain/usecases/marketing/save_marketing_target.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'marketing_event.dart';
part 'marketing_state.dart';

class MarketingBloc extends Bloc<MarketingEvent, MarketingState> {
  MarketingBloc({
    required GetMarketingTargets getMarketingTargets,
    required SaveMarketingTarget saveMarketingTarget,
    required EditMarketingTarget editMarketingTarget,
    required DeleteMarketingTarget deleteMarketingTarget,
  })  : _getMarketingTargets = getMarketingTargets,
        _saveMarketingTarget = saveMarketingTarget,
        _editMarketingTarget = editMarketingTarget,
        _deleteMarketingTarget = deleteMarketingTarget,
        super(const MarketingState()) {
    on<MarketingEvent>(
      (event, emit) => emit(state.copyWith(status: MarketingStatus.loading)),
    );
    on<GetMarketingTargetEvent>(_getMarketingTargetsHandler);
    on<SaveMarketingTargetEvent>(_saveMarketingTargetsHandler);
    on<EditMarketingTargetEvent>(_editMarketingTargetsHandler);
    on<DeleteMarketingTargetEvent>(_deleteMarketingTargetsHandler);
  }

  final GetMarketingTargets _getMarketingTargets;
  final SaveMarketingTarget _saveMarketingTarget;
  final EditMarketingTarget _editMarketingTarget;
  final DeleteMarketingTarget _deleteMarketingTarget;

  Future<void> _getMarketingTargetsHandler(
    GetMarketingTargetEvent event,
    Emitter<MarketingState> emit,
  ) async {
    final result = await _getMarketingTargets();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: MarketingStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (targets) => emit(
          state.copyWith(status: MarketingStatus.success, targets: targets),),
    );
  }

  Future<void> _saveMarketingTargetsHandler(
    SaveMarketingTargetEvent event,
    Emitter<MarketingState> emit,
  ) async {
    final result = await _saveMarketingTarget(event.target);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: MarketingStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (_) {
        final updatedTargets = List.of(state.targets)..add(event.target);
        emit(
          state.copyWith(
            status: MarketingStatus.success,
            targets: updatedTargets,
          ),
        );
      },
    );
  }

  Future<void> _editMarketingTargetsHandler(
    EditMarketingTargetEvent event,
    Emitter<MarketingState> emit,
  ) async {
    final result = await _editMarketingTarget(event.target);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: MarketingStatus.error,
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
            status: MarketingStatus.success,
            targets: updatedTargets,
          ),
        );
      },
    );
  }

  Future<void> _deleteMarketingTargetsHandler(
    DeleteMarketingTargetEvent event,
    Emitter<MarketingState> emit,
  ) async {
    final result = await _deleteMarketingTarget(event.target);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: MarketingStatus.error,
          errorMessage: failure.errorMessage,
        ),
      ),
      (_) => emit(
        state.copyWith(
          status: MarketingStatus.success,
          targets: state.targets
              .where((target) => target.id != event.target.id)
              .toList(),
        ),
      ),
    );
  }
}

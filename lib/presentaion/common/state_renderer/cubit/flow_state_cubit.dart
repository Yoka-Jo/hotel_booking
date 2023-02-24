import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../state_renderer_impl.dart';
part 'flow_state_state.dart';

class FlowStateCubit extends Cubit<FlowStateState> {
  FlowStateCubit() : super(FlowStateInitial());
  void setState(FlowState currrentState) {
    emit(FlowStateChangeState(currrentState));
  }
}

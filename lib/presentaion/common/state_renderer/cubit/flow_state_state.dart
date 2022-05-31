part of 'flow_state_cubit.dart';

abstract class FlowStateState extends Equatable {
  final FlowState currentState;

  const FlowStateState(this.currentState);

  @override
  List<Object> get props => [currentState];
}

class FlowStateInitial extends FlowStateState {
  FlowStateInitial() : super(ContentState());
}

class FlowStateChangeState extends FlowStateState {
  const FlowStateChangeState(FlowState currentState) : super(currentState);
}

import 'package:equatable/equatable.dart';

class BusState extends Equatable {
  const BusState();

  @override
  List<Object> get props => [];
}

class BusInitial extends BusState {
  const BusInitial();

  @override
  List<Object> get props => [];
}

class BusLoading extends BusState {
  const BusLoading();

  @override
  List<Object> get props => [];
}

class BusLoaded extends BusState {
  const BusLoaded();

  @override
  List<Object> get props => [];
}

class BusError extends BusState {
  final String message;
  const BusError(this.message);

  @override
  List<Object> get props => [message];
}

class BusTimeSelected extends BusState {
  final String time;
  const BusTimeSelected(this.time);
  @override
  List<Object> get props => [time];
}

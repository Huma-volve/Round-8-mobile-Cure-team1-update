import 'package:flutter_bloc/flutter_bloc.dart';

/// Helper extensions and utilities for BLoC
extension BlocExtension on Bloc {
  /// Dispose method for clean up
  void dispose() {
    close();
  }
}

/// Base class for all BLoCs
abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  // ignore: use_super_parameters
  BaseBloc(State initialState) : super(initialState);
}

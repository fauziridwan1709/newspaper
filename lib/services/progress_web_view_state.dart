import 'package:states_rebuilder/states_rebuilder.dart';

class ProgressWebViewState {
  double? _progress;

  double get progress => _progress ?? 0.0;
  set progress(double val) => _progress = val;
}

final progressWebViewRM = RM.inject(
  ProgressWebViewState.new,
);

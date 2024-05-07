import 'dart:async';
import 'dart:ui';

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  VoidCallback? action;

  Debouncer({required this.milliseconds});

  void run(VoidCallback latestAction) {
    action = latestAction;

    // if no timer or timer is not active then make a new timer
    if (_timer == null || (!(_timer?.isActive ?? false))) {
      _timer = makeNewTimer();
    }
  }

  Timer makeNewTimer() {
    return Timer(
      Duration(milliseconds: milliseconds),
      () {
        if (action != null) {
          action!();
        }
      },
    );
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}

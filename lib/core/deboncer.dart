import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(Future<void> Function() action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), () async {
      await action(); // await the async action to complete
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider for showing/hiding Password
final togglePassProvider =
    ChangeNotifierProvider((ref) => TogglePassChangeNotifier());

class TogglePassChangeNotifier extends ChangeNotifier {
  bool _toggle = false;
  bool get value => _toggle;

  void toggle() {
    _toggle = !_toggle;
    notifyListeners();
  }
}

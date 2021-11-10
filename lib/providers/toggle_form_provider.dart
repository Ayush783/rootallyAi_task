import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider for toggling between sign in and signup forms
final toggleFormProvider =
    ChangeNotifierProvider((ref) => ToggleFormChangeNotifier());

class ToggleFormChangeNotifier extends ChangeNotifier {
  bool _toggle = false;
  bool get value => _toggle;

  void toggle() {
    _toggle = !_toggle;
    notifyListeners();
  }
}

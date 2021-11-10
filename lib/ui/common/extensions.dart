//extensions for reducing code lines
extension DurationExtension on int {
  Duration seconds() => Duration(seconds: this);
}

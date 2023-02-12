extension DoubleExtension on double {
  String toPriceDollarString() {
    return '${toStringAsFixed(2)} \$';
  }

  String toRatingString() {
    return toStringAsFixed(1);
  }
}

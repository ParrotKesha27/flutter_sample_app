extension StringExtensions on String {
  String toCapitalize() =>
      length > 0 ? this[0].toUpperCase() + substring(1) : this;
}

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}

extension StringExtension on String {
  String capitalize() {
    return isEmpty
        ? ''
        : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String replaceSymbol() {
    return isEmpty ? '' : replaceAll(RegExp(r'(?:_|[^\w\s])+'), ' ');
  }
}

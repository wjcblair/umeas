abstract class IException implements Exception {
  final String message;

  const IException({required this.message});

  @override
  String toString() => '$runtimeType Exception: $message';
}

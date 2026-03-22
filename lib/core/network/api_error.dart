class ApiError {
  ApiError({required this.message, this.statusCode});
  final String message;
  final int? statusCode;

  @override
  String toString() {
    return message;
  }
}

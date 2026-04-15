class ApiErrors {
  final String message;
  final String? field;

 const ApiErrors({required this.message,  this.field});

 factory ApiErrors.fromJson(Map<String,dynamic> json) => ApiErrors(
  message: json['message'] as String,
  field: json['field'] as String?
  );
}
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/utils/app_string.dart';

class ErrorMessageModel extends Equatable {
  final String cod;
  final String message;

  const ErrorMessageModel({required this.cod, required this.message});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      cod: json[AppString.cod],
      message: json[AppString.message],
    );
  }

  @override
  List<Object?> get props => [
        cod,
        message,
      ];
}

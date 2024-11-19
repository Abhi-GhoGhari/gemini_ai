import 'package:get/get.dart';

class GeminiModel {
  RxString prompt;
  RxString responce;

  GeminiModel({
    required this.prompt,
    required this.responce,
  });

  factory GeminiModel.fromJson(Map<String, dynamic> json) => GeminiModel(
        prompt: json["prompt"].toString().obs,
        responce: json["responce"].toString().obs,
      );

  Map<String, dynamic> toJson() => {
        "prompt": prompt,
        "responce": responce,
      };
}

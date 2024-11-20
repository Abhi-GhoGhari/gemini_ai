class HistoryModel {
  String id;
  String answer;

  HistoryModel({
    required this.id,
    required this.answer,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        id: json["id"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
      };
}

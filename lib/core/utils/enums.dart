enum Category {
  quantitative,
  qualitative;

  String toJson() => name;
  static Category fromJson(String json) => values.byName(json);
}

enum Status {
  toDo,
  inProgress,
  done;

  String toJson() => name;
  static Status fromJson(String json) => values.byName(json);
}

enum TargetType {
  product,
  business,
  marketing;

  String toJson() => name;
  static TargetType fromJson(String json) => values.byName(json);
}

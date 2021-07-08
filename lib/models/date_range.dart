class DateRange {
  final String start;
  final String end;

  DateRange(this.start, this.end);

  factory DateRange.fromJson(Map<String, dynamic> json) =>
      DateRange(json["start"] as String, json["end"] as String);
}

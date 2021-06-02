part of research_package_model;

/// Class representing an Answer Format that lets participants use a slider to choose a value.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPSliderAnswerFormat extends RPAnswerFormat {
  double _minValue;
  double _maxValue;
  int _divisions;
  String _prefix;
  String _suffix;
  List<String> _options;

  RPSliderAnswerFormat();

  RPSliderAnswerFormat.withParams(this._minValue, this._maxValue,
      {divisions, prefix, suffix, options})
      : this._divisions = divisions,
        this._options = options ?? [],
        this._prefix = prefix ?? "",
        this._suffix = suffix ?? "";

  @override
  get questionType {
    return QuestionType.Scale;
  }

  /// The maximum value of the range.
  double get maxValue => _maxValue;

  /// The minimum value of the range.
  double get minValue => _minValue;

  /// The divisions of the range.
  int get divisions => _divisions;

  /// The prefix displayed before the value.
  String get prefix => _prefix;

  /// The suffix displayed after yhe value.
  String get suffix => _suffix;

  /// The list of strings with the values to display instead of a number.
  List<String> get options => _options;

  set maxValue(double maxValue) {
    this._maxValue = maxValue;
  }

  set minValue(double minValue) {
    this._minValue = minValue;
  }

  set divisions(int divisions) {
    this._divisions = divisions;
  }

  set prefix(String prefix) {
    this._prefix = prefix;
  }

  set suffix(String suffix) {
    this._suffix = suffix;
  }

  set options(List<String> options) {
    this._options = options;
  }

  factory RPSliderAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$RPSliderAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPSliderAnswerFormatToJson(this);
}

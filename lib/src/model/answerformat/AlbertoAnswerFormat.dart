part of research_package_model;

/// Class representing an Answer Format that lets participants choose from a fixed set of choices.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AlbertoAnswerFormat extends RPAnswerFormat {
  List<AlbertoChoice> _choices;
  ChoiceAnswerStyle answerStyle;
  String asset_path;

  AlbertoAnswerFormat();

  /// Returns an initialized choice answer format with the given [ChoiceAnswerStyle] and the set of [AlbertoChoice]s.
  AlbertoAnswerFormat.withParams(this.answerStyle, this._choices, this.asset_path) {
    questionType = answerStyle == ChoiceAnswerStyle.SingleChoice
        ? QuestionType.SingleChoice
        : QuestionType.MultipleChoice;
  }

  /// An array of available [AlbertoChoice] objects which represent the choices to the participant.
  List<AlbertoChoice> get choices => this._choices;

  set choices(List<AlbertoChoice> choices) {
    this._choices = choices;
  }

  factory AlbertoAnswerFormat.fromJson(Map<String, dynamic> json) => _$AlbertoAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$AlbertoAnswerFormatToJson(this);
}

/// The choice object which the participant can choose during a [RPQuestionStep] with [AlbertoAnswerFormat].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AlbertoChoice {
  String _text;
  int _value;
  String _detailText;
  bool _isFreeText;

  AlbertoChoice();

  /// Default constructor with [detailText] set to ```null```.
  AlbertoChoice.withParams(String text, int value, [this._isFreeText = false]) {
    this._text = text;
    this._value = value;
    this._detailText = null;
  }

  /// Constructor with the option to provide [detailText]
  AlbertoChoice.withDetailText(this._text, this._value, this._detailText);

  /// The text to display.
  get text => this._text;

  set text(String text) {
    this._text = text;
  }

  /// If set to true, then the user can enter the text instead of the default [text] which was provided. The [value] remains the same. By default it is set to false.
  get isFreeText => this._isFreeText;

  /// The value of the choice
  get value => this._value;

  set value(dynamic value) {
    this._value = value;
  }

  get detailText => this._detailText;

  set detailText(String detailText) {
    this._detailText = detailText;
  }

  factory AlbertoChoice.fromJson(Map<String, dynamic> json) => _$AlbertoChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$AlbertoChoiceToJson(this);
}

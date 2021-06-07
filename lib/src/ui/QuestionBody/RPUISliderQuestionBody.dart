part of research_package_ui;

class RPUISliderQuestionBody extends StatefulWidget {
  final RPSliderAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUISliderQuestionBody(this.answerFormat, this.onResultChange);

  @override
  _RPUISliderQuestionBodyState createState() => _RPUISliderQuestionBodyState();
}

class _RPUISliderQuestionBodyState extends State<RPUISliderQuestionBody>
    with AutomaticKeepAliveClientMixin<RPUISliderQuestionBody> {
  double value;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RPLocalizations locale = RPLocalizations.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(
            '${locale?.translate(widget.answerFormat.prefix) ?? widget.answerFormat.prefix}' + getTextMessage(locale) +'${locale?.translate(widget.answerFormat.suffix) ?? widget.answerFormat.suffix}',
            style: TextStyle(fontSize: 18),
          ),
          Slider(
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).primaryColor.withOpacity(0.2),
            value: value ?? widget.answerFormat.minValue,
            onChanged: (double newValue) {
              setState(() {
                value = newValue;
              });
              widget.onResultChange(value);
            },
            onChangeEnd: (double newValue) {
              if(value == null) {
                print('Ended change on $newValue');
                setState(() {
                  value = newValue;
                });
                widget.onResultChange(value);
              }
            },
            onChangeStart: (double startValue) {
              print('Started change at $startValue');
            },
            min: widget.answerFormat.minValue,
            max: widget.answerFormat.maxValue,
            divisions: widget.answerFormat.divisions,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  String getTextMessage(RPLocalizations locale) {
    if (widget.answerFormat.options.isEmpty) {
      if(value != null){
        return value.toString();
      } else return widget.answerFormat.minValue.toString();
    } else {
      double factor = ((widget.answerFormat.maxValue - widget.answerFormat.minValue) / widget.answerFormat.divisions);
      double myValue = value ?? widget.answerFormat.minValue;
      double minVal = widget.answerFormat.minValue;
      int index = ((myValue - minVal) / factor).toInt();
      String text = widget.answerFormat.options[index];
      return locale?.translate(text) ?? text;
    }
  }
}

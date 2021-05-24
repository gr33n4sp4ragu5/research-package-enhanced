import 'package:flutter/cupertino.dart';
import '../../../ui.dart';

class RPUIChoiceQuestionBodyWithImage extends StatefulWidget {
  final RPUIChoiceQuestionBody questionBody;
  final String asset_path;
  RPUIChoiceQuestionBodyWithImage(this.questionBody, {this.asset_path});
  @override
  _RPUIChoiceQuestionBodyWithImageState createState() => _RPUIChoiceQuestionBodyWithImageState();
}

class _RPUIChoiceQuestionBodyWithImageState extends State<RPUIChoiceQuestionBodyWithImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getImage(),
        widget.questionBody
      ],
    );
  }

  Widget getImage() {
    if(widget.asset_path == null) {
      return Text("");
    } else {
      return Image.asset(widget.asset_path);
    }
  }
}

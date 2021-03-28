import 'package:research_package/model.dart';

List<RPChoice> feelingsChoices0 = [
  RPChoice.withParams("Jelous", 3),
  RPChoice.withParams("Panicked", 2),
  RPChoice.withParams("Arrogant", 1),
  RPChoice.withParams("Hateful", 0),
];

List<RPChoice> feelingsChoices1 = [
  RPChoice.withParams("Playful", 3),
  RPChoice.withParams("Comforting", 2),
  RPChoice.withParams("Irritated", 1),
  RPChoice.withParams("Bored", 0),
];

List<RPChoice> feelingsChoices2 = [
  RPChoice.withParams("Terrified", 3),
  RPChoice.withParams("Upset", 2),
  RPChoice.withParams("Arrogant", 1),
  RPChoice.withParams("Annoyed", 0),
];

List<RPChoice> feelingsChoices3 = [
  RPChoice.withParams("Joking", 3),
  RPChoice.withParams("Flustered", 2),
  RPChoice.withParams("Desire", 1),
  RPChoice.withParams("Convinced", 0),
];


RPChoiceAnswerFormat feelingsAnswerFormat0 =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, feelingsChoices0, 'assets/images/readmindeyes/0.png');
RPChoiceAnswerFormat feelingsAnswerFormat1 =
RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, feelingsChoices1, 'assets/images/readmindeyes/1.png');
RPChoiceAnswerFormat feelingsAnswerFormat2 =
RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, feelingsChoices2, 'assets/images/readmindeyes/2.png');
RPChoiceAnswerFormat feelingsAnswerFormat3 =
RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, feelingsChoices3, 'assets/images/readmindeyes/3.png');

RPQuestionStep stepEmotions0 = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "What emotion better describes this face?",
  feelingsAnswerFormat0,
);
RPQuestionStep stepEmotions1 = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "What emotion better describes this face?",
  feelingsAnswerFormat1,
);
RPQuestionStep stepEmotions2 = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "What emotion better describes this face?",
  feelingsAnswerFormat2,
);
RPQuestionStep stepEmotions3 = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "What emotion better describes this face?",
  feelingsAnswerFormat3,
);



RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPInstructionStep instructionStep = RPInstructionStep(
    identifier: "instructionID", title: "Welcome!", detailText: "For the sake of science of course...")
  ..text =
      "Please fill out this questionnaire!\n\nIn this questionnaire the questions will come after each other in a given order. You still have the chance to skip a some of them though.";

RPOrderedTask linearSurveyTask = RPOrderedTask(
  "surveyTaskID",
  [
    instructionStep,
    stepEmotions0,
    stepEmotions1,
    stepEmotions2,
    stepEmotions3,
    completionStep
  ],
);

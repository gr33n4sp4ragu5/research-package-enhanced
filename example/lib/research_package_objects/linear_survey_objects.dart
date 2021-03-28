import 'package:flutter/widgets.dart';
import 'package:research_package/model.dart';

List<RPChoice> timeChoices = [
  RPChoice.withParams("All of the time", 5),
  RPChoice.withParams("Most of the time", 4),
  RPChoice.withParams("More than half of the time", 3),
  RPChoice.withParams("Less than half of the time", 2),
  RPChoice.withParams("Some of the time", 1),
  RPChoice.withParams("At no time", 0),
];

List<AlbertoChoice> timeChoicesAlberto = [
  AlbertoChoice.withParams("All of the time", 5),
  AlbertoChoice.withParams("Most of the time", 4),
  AlbertoChoice.withParams("More than half of the time", 3),
  AlbertoChoice.withParams("Less than half of the time", 2),
  AlbertoChoice.withParams("Some of the time", 1),
  AlbertoChoice.withParams("At no time", 0),
];

List<AlbertoChoice> joyfulActivities = [
  AlbertoChoice.withParams("Playing games", 6, true),
  AlbertoChoice.withParams("Jogging", 5),
  AlbertoChoice.withParams("Playing an instrument", 4),
  AlbertoChoice.withParams("Family and friends", 3),
  AlbertoChoice.withParams("Doing sports", 2),
  AlbertoChoice.withParams("Reading", 1),
  AlbertoChoice.withParams("Being productive", 0),
];

RPChoiceAnswerFormat timeAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, timeChoices, 'assets/images/owl-3.jpg');
AlbertoAnswerFormat timeAnswerFormatAlberto =
AlbertoAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, timeChoicesAlberto, 'assets/images/owl-3.jpg');
// All types of DateTime answer formats
RPDateTimeAnswerFormat timeOfDayAnswerFormat =
    RPDateTimeAnswerFormat.withParams(DateTimeAnswerStyle.TimeOfDay);
RPDateTimeAnswerFormat dateAndTimeAnswerFormat =
    RPDateTimeAnswerFormat.withParams(DateTimeAnswerStyle.DateAndTime);
RPDateTimeAnswerFormat dateAnswerFormat = RPDateTimeAnswerFormat.withParams(DateTimeAnswerStyle.Date);

AlbertoAnswerFormat joyfulActivitiesAnswerFormat =
    AlbertoAnswerFormat.withParams(ChoiceAnswerStyle.MultipleChoice, joyfulActivities, 'assets/images/waving-hand.png');


RPQuestionStep singleChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "I have felt cheerful and in good spirits",
  timeAnswerFormat,
);

RPQuestionStep singleChoiceQuestionStepAlberto = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "I have felt cheerful and in good spirits",
  timeAnswerFormatAlberto,
);

RPQuestionStep happinessChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "happinessChoiceQuestionStepID", "What makes you happy?", joyfulActivitiesAnswerFormat);


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
    singleChoiceQuestionStep,
    singleChoiceQuestionStepAlberto,
    happinessChoiceQuestionStep,
    completionStep
  ],
);

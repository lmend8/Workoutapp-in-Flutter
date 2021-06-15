import 'package:flutter/material.dart';
import 'package:flutter_workout_app/widget/background-image.dart';
import './quiz.dart';
import './result.dart';

/// This is the questionnaire to modify the user workouts
/// TODO: Implement this on the database.
///
///
class QuestioneerPage extends StatefulWidget {
  @override
  _QuestioneerPageState createState() => new _QuestioneerPageState();
}

class _QuestioneerPageState extends State<QuestioneerPage> {
  final _questions = const [
    {
      'questionText': 'Whats your Height?',
      'answers': [
        {'text': '4\' - 4\'3"', 'score': -2},
        {'text': '4\'4" - 4\'7"', 'score': -2},
        {'text': '4\'8" - 4\'11"', 'score': -2},
        {'text': '5\' - 5\'3"', 'score': -2},
        {'text': '5\'4" - 5\'7"', 'score': -2},
        {'text': '5\'8" - 5\'11"', 'score': -2},
        {'text': '6\' - 6\'3"', 'score': -2},
        {'text': '6\'4" - 6\'7"', 'score': -2},
        {'text': '6\'8" - 6\'11"', 'score': -2},
        {'text': '7\' - 7\'3"', 'score': -2},
        {'text': '7\'4" - 7\'7"', 'score': -2},
      ],
    },
    {
      'questionText': 'Whats your weight?',
      'answers': [
        {'text': 'Below 90lbs', 'score': -2},
        {'text': '100lbs. - 110lbs', 'score': -2},
        {'text': '110lbs. - 120lbs', 'score': -2},
        {'text': '120lbs. - 130lbs', 'score': -2},
        {'text': '130lbs. - 140lbs', 'score': -2},
        {'text': '150lbs. - 160lbs', 'score': -2},
        {'text': '160lbs. - 170lbs', 'score': -2},
        {'text': '170lbs. - 180lbs', 'score': -2},
        {'text': '180lbs. - 190lbs', 'score': -2},
        {'text': '190lbs. - 200lbs', 'score': -2},
        {'text': 'Over 200lbs', 'score': -2},
      ],
    },
    {
      'questionText':
          'Which days am I available to workout? (Leave at least one day for a rest day)',
      'answers': [
        {'text': 'Monday', 'score': -2},
        {'text': 'Tuesday', 'score': -2},
        {'text': 'Wednesday', 'score': -2},
        {'text': 'Thursday', 'score': -2},
        {'text': 'Friday', 'score': -2},
        {'text': 'Saturday', 'score': -2},
        {'text': 'Sunday', 'score': -2},
      ],
    },
    {
      'questionText':
          'How long would I like to spend exercising each workout day?',
      'answers': [
        {'text': '30 Minutes', 'score': 10},
        {'text': '45 Minutes', 'score': -2},
        {'text': '60 Minutes', 'score': -2},
      ],
    },
    {
      'questionText': 'I will say that my body',
      'answers': [
        {'text': 'Carries extra fat', 'score': 10},
        {'text': 'Is mostly skinny', 'score': -2},
        {'text': 'Is somewhat lean but muscular', 'score': -2},
      ],
    },
    {
      'questionText': 'Whuch are wider, my shoulders or my waist?',
      'answers': [
        {'text': 'My waist is wider', 'score': 10},
        {'text': 'My shoulders are wider', 'score': -2},
        {'text': 'They are about the same', 'score': -2},
      ],
    },
    {
      'questionText': 'When I flex my legs',
      'answers': [
        {'text': 'There is no diference', 'score': 10},
        {'text': 'There is slight definition', 'score': -2},
        {'text': 'There is noticeable definition', 'score': -2},
      ],
    },
    {
      'questionText': 'When I flex my back',
      'answers': [
        {'text': 'There is no difference', 'score': 10},
        {'text': 'There is slight definition', 'score': -2},
        {'text': 'There is noticeable definition', 'score': -2},
      ],
    },
    {
      'questionText':
          'In standing posture and without sucking in my gut, does my chest extend past my belly?',
      'answers': [
        {'text': 'No, my belly is larger', 'score': 10},
        {'text': 'No, its about the same', 'score': -2},
        {'text': 'Yes, my chest is larger than my belly', 'score': -2},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
    ]); //MaterialApp
  }
}

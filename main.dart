import 'package:flutter/material.dart';

void main() {
  runApp(MCQApp());
}

class MCQApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCQ Yes/No App',
      home: MCQScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MCQScreen extends StatefulWidget {
  @override
  _MCQScreenState createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreen> {
  int currentIndex = 0;
  final List<Map<String, String>> questions = [
    {'question': 'Is Flutter used for mobile app development?'},
    {'question': 'Is the earth flat?'},
    {'question': 'Is water a compound?'},
    {'question': 'Do birds fly?'},
    {'question': 'Is Python a snake or a language?'},
    {'question': 'Can fish walk on land?'},
    {'question': 'Is Java the same as JavaScript?'},
    {'question': 'Is the sun a star?'},
    {'question': 'Do humans need oxygen?'},
    {'question': 'Is 2+2=4?'},
    {'question': 'Is gold a metal?'},
    {'question': 'Do cars swim in water?'},
    {'question': 'Is space black?'},
    {'question': 'Is light faster than sound?'},
    {'question': 'Can elephants fly?'},
    {'question': 'Is gravity real?'},
    {'question': 'Is milk white?'},
    {'question': 'Do trees produce oxygen?'},
    {'question': 'Is fire cold?'},
    {'question': 'Is Earth the 3rd planet from the sun?'}
  ];

  List<String> answers = [];

  void answerQuestion(String answer) {
    setState(() {
      answers.add(answer);
      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(answers)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MCQ Yes/No App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentIndex]['question']!,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => answerQuestion('Yes'),
              child: Text('Yes'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => answerQuestion('No'),
              child: Text('No'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final List<String> answers;
  ResultScreen(this.answers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Answers')),
      body: ListView.builder(
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Q${index + 1}: ${answers[index]}'),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: use_key_in_widget_constructors
class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soru ve Şıklar',
      home: MyQuizPage(),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;

  Question(this.questionText, this.options);
}

class MyQuizPage extends StatefulWidget {
  const MyQuizPage({super.key});

  @override
  _MyQuizPageState createState() => _MyQuizPageState();
}

class _MyQuizPageState extends State<MyQuizPage> {
  Map<String, bool?> userAnswers = {};

  List<Question> questions = [
    Question(
      '1. What are the general characteristics of 1st degree burns?',
      [
        'a) Blisters filled with water are formed  ',
        'b) Painful and usually heals within 48 hours  ',
        'c) Affects all layers of the skin  ',
        'd) Color changes up to black color  ',
        'e) Painless because the nerves were damaged'
      ],
    ),
    Question(
      '2. Which is the correct step for first aid in chemical burns?',
      [
        'a) Keep the burned area under unpressurized and plenty of cold water for at least 20 minutes.  ',
        'b) The electric current is interrupted and the person is prevented from contact with an insulating material  ',
        'c) The patient is taken to a cool and airy place, clothes are removed  ',
        'd) Medical assistance is sought after the chemical ceases to come into contact with the skin  ',
        'e) Water collecting places are not blasted',
      ],
    ),
    Question(
      '3. Which is a valid step for first aid in electrical burns?',
      [
        'a) Wash the burned area with plenty of unpressurized running water  ',
        'b) The patient is placed on his/her back and the arms and legs are raised  ',
        'c) If it is not possible to interrupt the current, contact with an insulating material is prevented  ',
        'd) The patient or injured person airway patency and respiration are evaluated  ',
        'e) If the patient or injured person is conscious and feels well, medical assistance is requested',
      ],
    ),
    Question(
      '4. What should be considered when bandaging the burn area?',
      [
        'a) No substance is applied on the burn  ',
        'b) The burn is not covered with a clean and damp cloth  ',
        'c) Water collecting places are blasted  ',
        'd) Burned areas are bandaged together  ',
        'e) If the patient or injured person is unconscious, a drink is given to replenish fluid loss',
      ],
    ),
    Question(
      '5. In case of heat stroke, which fluid can be given to the patient?',
      [
        'a) Water only  ',
        'b) Salt water only  ',
        'c) Liquid prepared to replace water and salt loss  ',
        'd) Mineral water  ',
        'e) Liquid containing baking soda',
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burn Knowledge Assessment Test'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(color: HexColor("#FF003E")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(questions.length, (index) {
              Question currentQuestion = questions[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentQuestion.questionText,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: currentQuestion.options.map((option) {
                      return CheckboxListTile(
                        title: Text(
                          option,
                          style: const TextStyle(fontSize: 16),
                        ),
                        value: userAnswers['$index$option'] ?? false,
                        onChanged: (value) {
                          setState(() {
                            userAnswers['$index$option'] = value;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        tileColor: userAnswers['$index$option'] ?? false
                            ? const Color.fromARGB(255, 186, 186, 186)
                            : null,
                        activeColor: userAnswers['$index$option'] ?? false
                            ? HexColor("#FF003E")
                            : null,
                      );
                    }).toList(),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

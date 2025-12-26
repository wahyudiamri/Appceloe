import 'package:flutter/material.dart';
import 'package:appceloe/models/quiz_question.dart';
import 'package:appceloe/utils/theme.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Static quiz data
  final List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Apa kepanjangan dari UI?',
      options: ['User Interaction', 'User Interface', 'User Integration', 'Uniform Interface'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Manakah yang termasuk prinsip desain UI?',
      options: ['Kekacauan', 'Konsistensi', 'Kompleksitas', 'Abstraksi'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Apa fungsi dari Wireframe?',
      options: ['Hasil akhir desain', 'Kerangka dasar layout', 'Database schema', 'Kode program'],
      correctAnswerIndex: 1,
    ),
  ];

  int _currentQuestionIndex = 0;
  int _selectedOptionIndex = -1;
  int _score = 0;
  bool _isFinished = false;

  void _answerQuestion() {
    if (_selectedOptionIndex == -1) return;

    if (_selectedOptionIndex == questions[_currentQuestionIndex].correctAnswerIndex) {
      _score++;
    }

    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = -1;
      });
    } else {
      setState(() {
        _isFinished = true;
      });
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Kuis Selesai!'),
        content: Text(
          'Skor Kamu: $_score / ${questions.length}',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Go back to previous screen
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Soal ${_currentQuestionIndex + 1} / ${questions.length}'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedOptionIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOptionIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: isSelected ? CeloeTheme.primaryColor.withOpacity(0.1) : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected ? CeloeTheme.primaryColor : Colors.grey.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            String.fromCharCode(65 + index), // A, B, C, D
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? CeloeTheme.primaryColor : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              question.options[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _selectedOptionIndex != -1 ? _answerQuestion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: CeloeTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  _currentQuestionIndex == questions.length - 1 ? 'Selesai' : 'Lanjut',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

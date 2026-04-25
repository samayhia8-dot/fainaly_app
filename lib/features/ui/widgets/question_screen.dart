import 'package:flutter/material.dart';
import 'lesson_completed_screen.dart';

class QuestionScreen extends StatefulWidget {
  final int questionIndex;
  const QuestionScreen({super.key, required this.questionIndex});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? selectedIndex;
  bool? isCorrect;
  final TextEditingController _textController = TextEditingController();
  bool _showFeedback = false;

  final List<Map<String, dynamic>> questions = [
    // Que 1 - Select correct image (Man/Woman/Boy/Girl)
    {
      'type': 'image_select',
      'title': 'Select the correct image',
      'word': 'jongen',
      'options': [
        {'emoji': '👨', 'label': 'Man'},
        {'emoji': '👩', 'label': 'Woman'},
        {'emoji': '👦', 'label': 'Boy'},
        {'emoji': '👧', 'label': 'Girl'},
      ],
      'correct': 2,
    },
    // Que 2 - Select correct image
    {
      'type': 'image_select',
      'title': 'Select the correct image',
      'word': 'jongen',
      'options': [
        {'emoji': '👨', 'label': 'Man'},
        {'emoji': '👩', 'label': 'Woman'},
        {'emoji': '👦', 'label': 'Boy'},
        {'emoji': '👧', 'label': 'Girl'},
      ],
      'correct': 2,
    },
    // Que 3 - Select correct image (highlighted correct)
    {
      'type': 'image_select',
      'title': 'Select the correct image',
      'word': 'jongen',
      'options': [
        {'emoji': '👨', 'label': 'Man'},
        {'emoji': '👩', 'label': 'Woman'},
        {'emoji': '👦', 'label': 'Boy'},
        {'emoji': '👧', 'label': 'Girl'},
      ],
      'correct': 2,
    },
    // Que 4 - Guess its meaning (sun/moon)
    {
      'type': 'meaning_guess',
      'title': 'Guess its meaning...',
      'word': '☀️',
      'options': ['Goede morgen', 'Goede avond', 'Goede nacht', 'Goede middag'],
      'correct': 0,
    },
    // Que 5 - Guess its meaning (text)
    {
      'type': 'meaning_guess',
      'title': 'Guess its meaning...',
      'word': '🌙',
      'options': ['Goede morgen', 'Tot ziens', 'Goede nacht', 'Goede middag'],
      'correct': 2,
    },
    // Que 6 - Select correct word (audio)
    {
      'type': 'word_select',
      'title': 'Select the correct word',
      'audio': 'Hoi',
      'options': ['Goedemorgen', 'Hoi', 'Tot ziens', 'Goed Hoi'],
      'correct': 1,
    },
    // Que 7 - Select correct word with keyboard
    {
      'type': 'word_select',
      'title': 'Select the correct word',
      'audio': 'Goedemorgen',
      'options': ['Goedemorgen', 'Hoi', 'Tot ziens', 'Goed bad'],
      'correct': 0,
    },
    // Que 8 - Type translation
    {
      'type': 'type_answer',
      'title': 'Convert this text into Dutch',
      'word': 'Hello',
      'correct_text': 'Hoi',
    },
  ];

  void _checkAnswer(int index) {
    final q = questions[widget.questionIndex];
    setState(() {
      selectedIndex = index;
      isCorrect = index == q['correct'];
      _showFeedback = true;
    });
  }

  void _checkTextAnswer() {
    final q = questions[widget.questionIndex];
    final correct = _textController.text.trim().toLowerCase() == (q['correct_text'] as String).toLowerCase();
    setState(() {
      isCorrect = correct;
      _showFeedback = true;
    });
  }

  void _next() {
    final nextIndex = widget.questionIndex + 1;
    if (nextIndex >= questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LessonCompletedScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => QuestionScreen(questionIndex: nextIndex)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[widget.questionIndex];
    final progress = (widget.questionIndex + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7C4DFF)),
            minHeight: 8,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Text(
                '${widget.questionIndex + 1}/${questions.length}',
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: _buildQuestion(q),
            ),
          ),
          if (_showFeedback) _buildFeedbackBar(),
        ],
      ),
    );
  }

  Widget _buildQuestion(Map<String, dynamic> q) {
    switch (q['type']) {
      case 'image_select':
        return _buildImageSelect(q);
      case 'meaning_guess':
        return _buildMeaningGuess(q);
      case 'word_select':
        return _buildWordSelect(q);
      case 'type_answer':
        return _buildTypeAnswer(q);
      default:
        return const SizedBox();
    }
  }

  Widget _buildImageSelect(Map<String, dynamic> q) {
    final options = q['options'] as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(q['title'], style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A45),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(q['word'], style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: options.length,
            itemBuilder: (ctx, i) {
              final opt = options[i];
              Color borderColor = Colors.transparent;
              Color bgColor = const Color(0xFF2A2A45);

              if (selectedIndex == i) {
                if (isCorrect == true) {
                  borderColor = const Color(0xFF00E676);
                  bgColor = const Color(0xFF00E676).withOpacity(0.15);
                } else {
                  borderColor = const Color(0xFFFF5252);
                  bgColor = const Color(0xFFFF5252).withOpacity(0.15);
                }
              } else if (_showFeedback && i == q['correct']) {
                borderColor = const Color(0xFF00E676);
              }

              return GestureDetector(
                onTap: _showFeedback ? null : () => _checkAnswer(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(opt['emoji'], style: const TextStyle(fontSize: 48)),
                      const SizedBox(height: 8),
                      Text(opt['label'], style: const TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMeaningGuess(Map<String, dynamic> q) {
    final options = q['options'] as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(q['title'], style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 24),
        Center(child: Text(q['word'], style: const TextStyle(fontSize: 72))),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            itemCount: options.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (ctx, i) {
              Color borderColor = Colors.transparent;
              Color bgColor = const Color(0xFF2A2A45);

              if (selectedIndex == i) {
                if (isCorrect == true) {
                  borderColor = const Color(0xFF00E676);
                  bgColor = const Color(0xFF00E676).withOpacity(0.15);
                } else {
                  borderColor = const Color(0xFFFF5252);
                  bgColor = const Color(0xFFFF5252).withOpacity(0.15);
                }
              } else if (_showFeedback && i == q['correct']) {
                borderColor = const Color(0xFF00E676);
              }

              return GestureDetector(
                onTap: _showFeedback ? null : () => _checkAnswer(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: Text(options[i], style: const TextStyle(color: Colors.white, fontSize: 16)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWordSelect(Map<String, dynamic> q) {
    final options = q['options'] as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(q['title'], style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A45),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const Icon(Icons.volume_up, color: Color(0xFF7C4DFF), size: 30),
              const SizedBox(width: 12),
              Text(q['audio'], style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: options.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (ctx, i) {
              Color borderColor = Colors.transparent;
              Color bgColor = const Color(0xFF2A2A45);

              if (selectedIndex == i) {
                if (isCorrect == true) {
                  borderColor = const Color(0xFF00E676);
                  bgColor = const Color(0xFF00E676).withOpacity(0.15);
                } else {
                  borderColor = const Color(0xFFFF5252);
                  bgColor = const Color(0xFFFF5252).withOpacity(0.15);
                }
              } else if (_showFeedback && i == q['correct']) {
                borderColor = const Color(0xFF00E676);
              }

              return GestureDetector(
                onTap: _showFeedback ? null : () => _checkAnswer(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: Text(options[i], style: const TextStyle(color: Colors.white, fontSize: 16)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTypeAnswer(Map<String, dynamic> q) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(q['title'], style: const TextStyle(color: Colors.white70, fontSize: 14)),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A45),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Text(q['word'], style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              const Text('🇺🇸', style: TextStyle(fontSize: 20)),
              const Spacer(),
              const Icon(Icons.arrow_forward, color: Colors.white54),
              const SizedBox(width: 8),
              const Text('🇳🇱', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _textController,
          enabled: !_showFeedback,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          decoration: InputDecoration(
            hintText: 'Type in Dutch...',
            hintStyle: const TextStyle(color: Colors.white38),
            filled: true,
            fillColor: const Color(0xFF2A2A45),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFF7C4DFF), width: 2),
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (!_showFeedback)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C4DFF),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _checkTextAnswer,
              child: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        if (_showFeedback) ...[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isCorrect == true
                  ? const Color(0xFF00E676).withOpacity(0.15)
                  : const Color(0xFFFF5252).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isCorrect == true ? const Color(0xFF00E676) : const Color(0xFFFF5252),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isCorrect == true ? Icons.check_circle : Icons.cancel,
                  color: isCorrect == true ? const Color(0xFF00E676) : const Color(0xFFFF5252),
                ),
                const SizedBox(width: 8),
                Text(
                  isCorrect == true ? 'Correct! 🎉' : 'Correct answer: ${q['correct_text']}',
                  style: TextStyle(
                    color: isCorrect == true ? const Color(0xFF00E676) : const Color(0xFFFF5252),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildFeedbackBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect == true
            ? const Color(0xFF00E676).withOpacity(0.1)
            : const Color(0xFFFF5252).withOpacity(0.1),
        border: Border(
          top: BorderSide(
            color: isCorrect == true ? const Color(0xFF00E676) : const Color(0xFFFF5252),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            isCorrect == true ? Icons.check_circle : Icons.cancel,
            color: isCorrect == true ? const Color(0xFF00E676) : const Color(0xFFFF5252),
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              isCorrect == true ? 'Correct Answer!' : 'Wrong Answer! Try again.',
              style: TextStyle(
                color: isCorrect == true ? const Color(0xFF00E676) : const Color(0xFFFF5252),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isCorrect == true ? const Color(0xFF00E676) : const Color(0xFFFF5252),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: _next,
            child: Text(
              isCorrect == true ? 'Next' : 'Try again',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
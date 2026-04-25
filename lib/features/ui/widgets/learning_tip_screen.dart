import 'package:flutter/material.dart';
import 'question_screen.dart';

class LearningTipScreen extends StatelessWidget {
  const LearningTipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.05,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7C4DFF)),
                minHeight: 8,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Illustration area
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A45),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('🌍', style: TextStyle(fontSize: 60)),
                    SizedBox(height: 8),
                    Text('🇬🇧 🇳🇱', style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Learning Tip',
              style: TextStyle(
                color: Color(0xFF7C4DFF),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Before you start the lesson, go through the vocabulary words to get familiar with them.',
              style: TextStyle(color: Colors.white, fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C4DFF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const QuestionScreen(questionIndex: 0),
                    ),
                  );
                },
                child: const Text('Got it!', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
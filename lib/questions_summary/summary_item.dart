import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.data});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: data['answer'] == data['user_answer']
                ? Colors.green
                : const Color.fromARGB(255, 229, 47, 111),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            ((data['question_index'] as int) + 1).toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'] as String,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                data['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 153, 222, 73),
                  fontSize: 16,
                ),
              ),
              Text(
                data['answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 250, 239, 76),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

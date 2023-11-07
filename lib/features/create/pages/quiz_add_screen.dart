import 'package:flutter/material.dart';
import 'package:my_quiz/features/create/widgets/question_input_field.dart';
import 'package:my_quiz/features/create/widgets/question_list.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quiz'),
      ),
      body: Column(
        children: [
          // title
          QuestionInputField(
              controller: titleController, hintText: 'Enter a Title'),
          // description
          QuestionInputField(
              controller: descriptionController,
              hintText: 'Enter a Description'),
          // question list
          const QuestionList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

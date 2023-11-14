import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_quiz/app.dart';
import 'package:my_quiz/core/Provider/mock/quiz_instance_mock.dart';
import 'package:my_quiz/core/Provider/quiz_instance_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      builder: (context) {
        return const ProviderScope(
          child: MyQuiz(),
        );
      },
    ),
  );
}

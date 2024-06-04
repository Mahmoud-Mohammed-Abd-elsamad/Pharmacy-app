import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/medical_speciality.dart';
import 'chatpage.dart';

class ChatBotLayout extends StatelessWidget {
  ChatBotLayout({super.key});

  final MedicalSpecialtyRecommenderApi api = MedicalSpecialtyRecommenderApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('🤖'),
            SizedBox(
              width: 26,
            ),
            Text(
              'chat bot',
              style: TextStyle(color: Color(0xff264773)),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: ChatPage(api: api),
    );
  }
}

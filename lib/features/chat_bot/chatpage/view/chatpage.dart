import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/custom_text_feild.dart';
import '../../service/medical_speciality.dart';

class ChatPage extends StatefulWidget {
  final MedicalSpecialtyRecommenderApi api;

  ChatPage({required this.api});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  List<String> chatMessages = [];
  bool isLoading = false;
  String errorMessage = '';
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            //reverse: true,
            itemCount: chatMessages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Align(
                  alignment: chatMessages[index].startsWith('You:')
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: chatMessages[index].startsWith('You:')
                          ? Colors.blue[100]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: chatMessages[index].startsWith('You:')
                            ? Radius.circular(16)
                            : Radius.zero,
                        topRight: !chatMessages[index].startsWith('You:')
                            ? Radius.circular(16)
                            : Radius.zero,
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      chatMessages[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ),
        if (chatMessages.isEmpty)
          Align(
            child: Text(
              'Enter the illness you feel',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFeild(
                  hintText: 'Message',
                  controller: _messageController,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue[300]),
                child: IconButton(
                    onPressed: () {
                      final message = _messageController.text;
                      if (message.isNotEmpty) {
                        setState(() {
                          chatMessages.add('You: $message');
                          isLoading = true;
                        });

                        _sendMessageAndGetResponse(message);
                        _messageController.clear();
                        scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 26,
                    )),
              )
            ],
          ),
        ),
        if (isLoading)
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }

  Future<void> _sendMessageAndGetResponse(String message) async {
    try {
      final response = await widget.api.getSpecializations(message);
      if (mounted) {
        setState(() {
          chatMessages.add('🤖 : $response');
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = 'Failed to communicate with chatbot';
          isLoading = false;
        });
      }
      print('error $e');
    }
  }
}




//https://1d6321c9-49e5-4f09-b5fd-dc4b86c64e33-00-2gf6maddwvn8i.spock.replit.dev:5173


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;

    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'userImage': userData.data()!['imageUrl'],
      'username': userData.data()!['username'],
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(
        left: 15,
        right: 1,
        bottom: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization:
                  TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(
                label: Text("Send a message..."),
              ),
            ),
          ),
          IconButton(
            onPressed: _submitMessage,
            icon: const Icon(Icons.send),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

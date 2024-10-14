import 'package:flutter/material.dart';

class MessageError extends StatelessWidget {
  const MessageError({super.key, required this.Message});
  final String Message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Message,
              style: const TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 231, 231, 133)),
            ),
          ],
        ),
      ),
    );
  }
}

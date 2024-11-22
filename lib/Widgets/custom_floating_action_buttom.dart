import 'package:flutter/material.dart';

class CustomFloatingActionButtom extends StatelessWidget {
  const CustomFloatingActionButtom({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      tooltip: "Go Up",
      splashColor: Colors.cyan,
      enableFeedback: true,
      backgroundColor: Colors.blue,
      onPressed: () {
        scrollController.animateTo(2,
            duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      },
      child: const Icon(Icons.arrow_upward_sharp),
    );
  }
}

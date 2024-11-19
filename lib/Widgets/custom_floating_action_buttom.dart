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
      backgroundColor: Colors.cyan,
      onPressed: () {
        scrollController.animateTo(2,
            duration: Duration(seconds: 1), curve: Curves.easeInOut);
      },
      child: const Icon(Icons.upgrade_outlined),
    );
  }
}

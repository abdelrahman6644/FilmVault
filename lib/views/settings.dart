import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    int index = AdaptiveTheme.of(context).mode.isDark
        ? 0
        : (AdaptiveTheme.of(context).mode.isLight ? 1 : 2);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: CustomScrollView(slivers: [
          const SliverAppBar(
            iconTheme: IconThemeData(
              color: Colors.cyan,
            ),
            pinned: true,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomButtomMode(
                      index: index,
                      text: 'Dark',
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                        AdaptiveTheme.of(context).setDark();
                      },
                    ),
                    CustomButtomMode(
                      index: index,
                      text: 'System',
                      borderRadius: const BorderRadius.all(
                        Radius.circular(0),
                      ),
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                        AdaptiveTheme.of(context).setSystem();
                      },
                    ),
                    CustomButtomMode(
                      index: index,
                      text: 'Light',
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                        AdaptiveTheme.of(context).setLight();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomButtomMode extends StatelessWidget {
  const CustomButtomMode({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.onPressed,
    required this.index,
  });
  final String text;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    int currentIndex = getindex(text);
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 37),
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: currentIndex == index
                ? Colors.blue
                : Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey),
              borderRadius: borderRadius,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  getindex(String text) {
    if (text == "Dark") {
      return 0;
    } else if (text == "Light") {
      return 1;
    } else {
      return 2;
    }
  }
}

import 'package:crud/class/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class themeswitch extends StatefulWidget {
  const themeswitch({super.key});

  @override
  State<themeswitch> createState() => _themeswitchState();
}

class _themeswitchState extends State<themeswitch> {
  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Switcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Toggle Theme'),
            SizedBox(height: 10),
            Container(
              width: 200, // Adjust the width as needed
              child: Slider(
                value: themeNotifier.currentTheme.brightness == Brightness.dark
                    ? 1.0
                    : 0.0,
                onChanged: (value) {
                  if (value == 0.0) {
                    themeNotifier.toggleLightTheme();
                  } else {
                    themeNotifier.toggleDarkTheme();
                  }
                },
                divisions: 1,
                label: themeNotifier.currentTheme.brightness == Brightness.dark
                    ? 'Dark'
                    : 'Light',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

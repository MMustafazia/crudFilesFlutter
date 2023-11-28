import 'package:flutter/material.dart';

class check extends StatefulWidget {
  const check({super.key});

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Changing Screen'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _changeBackgroundColor(Colors.blue);
                  setState(() {});
                },
                child: Text('Blue'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _changeBackgroundColor(Colors.green),
                child: Text('Green'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _changeBackgroundColor(Colors.red),
                child: Text('Red'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

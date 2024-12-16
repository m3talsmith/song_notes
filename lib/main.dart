import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<IconButton> buttons = [];

  late ScrollController _scrollController;
  bool showBackToTopButton = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Song Notes',
      theme: ThemeData(
        colorSchemeSeed: Colors.purple.shade200,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Song Notes'),
        ),
        body: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...buttons.map((button) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: button,
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NoteButtonForm()));
                    },
                    child: const Text('beepboop'))
              ],
            ),
          ),
        ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class NoteButtonForm extends StatefulWidget {
  const NoteButtonForm({super.key});

  @override
  State<NoteButtonForm> createState() => _NoteButtonFormState();
}

class _NoteButtonFormState extends State<NoteButtonForm> {
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(
          onChanged: (value) => setState(() {
            _name = value;
          }),
          decoration: const InputDecoration(
            labelText: 'Name',
            icon: Icon(Icons.folder),
          ),
        ),
      ],
    ));
  }
}
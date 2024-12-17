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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Song Notes',
      theme: ThemeData(
        colorSchemeSeed: Colors.purple.shade200,
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Song Notes'),
          ),
          body: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...buttons.map((button) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: button,
                      ))
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => NoteButtonForm(
                  onSave: (name) {
                    setState(() {
                      buttons.add(
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.folder),
                        ),
                      );
                    });
                  },
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}

class NoteButtonForm extends StatefulWidget {
  const NoteButtonForm({super.key, this.onSave});

  final Function(String name)? onSave;

  @override
  State<NoteButtonForm> createState() => _NoteButtonFormState();
}

class _NoteButtonFormState extends State<NoteButtonForm> {
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FilledButton(
                onPressed: () {
                  widget.onSave?.call(_name ?? '');
                  Navigator.pop(context);
                },
                child: const Text('Save')),
          )
        ],
      ),
    ));
  }
}

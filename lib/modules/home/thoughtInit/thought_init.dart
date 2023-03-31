import 'package:flutter/material.dart';
import 'package:isar_structure/providers/thought.dart';
import 'package:isar_structure/services/inject.dart';

final thoughtInitKey = GlobalKey();

class ThoughtInit extends StatefulWidget {
  const ThoughtInit({
    super.key,
    this.thoughtId = -1,
  });

  final int thoughtId;

  @override
  State<ThoughtInit> createState() => _ThoughtInitState();
}

class _ThoughtInitState extends State<ThoughtInit> {
  final thoughtController = TextEditingController();
  final thoughtProvider = serviceLocator.get<ThoughtProvider>();

  @override
  void initState() {
    super.initState();
    if (widget.thoughtId != -1) {
      thoughtProvider.getThought(widget.thoughtId).then((thought) {
        thoughtController.text = thought!.thought.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Form(
        key: thoughtInitKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: thoughtController,
                keyboardType: TextInputType.multiline,
                maxLines: 15,
                decoration: const InputDecoration(
                  hintText: 'Enter a thought',
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (widget.thoughtId != -1) {
                    thoughtProvider
                        .updateThought(
                          widget.thoughtId,
                          thought: thoughtController.text,
                        )
                        .then((value) => Navigator.of(context).pop());
                  } else {
                    thoughtProvider
                        .createThought(
                          thought: thoughtController.text,
                        )
                        .then((value) => Navigator.of(context).pop());
                  }
                },
                child: Text(
                    widget.thoughtId != -1 ? 'Update Thought' : 'Init Thought'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

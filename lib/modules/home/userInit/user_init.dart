import 'package:flutter/material.dart';
import 'package:isar_structure/providers/user.dart';
import 'package:isar_structure/services/inject.dart';

final userInitKey = GlobalKey();

class UserInit extends StatefulWidget {
  const UserInit({
    super.key,
    this.userId = -1,
  });

  final int userId;

  @override
  State<UserInit> createState() => _UserInitState();
}

class _UserInitState extends State<UserInit> {
  final userProvider = serviceLocator.get<UserProvider>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void initState() {
    if (widget.userId != -1) {
      userProvider.getUser(widget.userId).then((user) {
        nameController.text = user!.name.toString();
        ageController.text = user.age.toString();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: userInitKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter your age',
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (widget.userId != -1) {
                      userProvider
                          .updateUser(
                            widget.userId,
                            name: nameController.text,
                            age: ageController.text,
                          )
                          .then((value) => Navigator.of(context).pop());
                    } else {
                      userProvider
                          .createUser(
                            name: nameController.text,
                            age: ageController.text,
                          )
                          .then((value) => Navigator.of(context).pop());
                    }
                  },
                  child:
                      Text(widget.userId != -1 ? 'Update User' : 'Init User'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

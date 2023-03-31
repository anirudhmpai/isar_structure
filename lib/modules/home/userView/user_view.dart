import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:isar_structure/collections/user/user.dart';
import 'package:isar_structure/modules/home/thoughtInit/thought_init.dart';
import 'package:isar_structure/providers/thought.dart';
import 'package:isar_structure/providers/user.dart';
import 'package:isar_structure/services/inject.dart';

class UserView extends StatefulWidget {
  const UserView({super.key, required this.userId});

  final int userId;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final userProvider = serviceLocator.get<UserProvider>();
  final thoughtProvider = serviceLocator.get<ThoughtProvider>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      thoughtProvider.initThought(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Thoughts"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FutureBuilder<User?>(
                future: userProvider.getUser(widget.userId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return bodyContent(snapshot);
                  } else {
                    return const Center(child: Text('Error showing data'));
                  }
                },
              ),
            ),
            Consumer<ThoughtProvider>(
              builder: (_, __, ___) {
                return thoughtProvider.thoughts.isEmpty
                    ? const SliverToBoxAdapter(
                        child: Center(
                          child: Text('No thoughts to display'),
                        ),
                      )
                    : thoughtsSection();
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ThoughtInit(),
          )),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Padding bodyContent(AsyncSnapshot<User?> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Row(children: [
            Text(
              snapshot.data!.name.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(' - '),
            Text(
              snapshot.data!.age.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ]),
          const SizedBox(height: 15),
          const Divider(
            color: Colors.black54,
          ),
          const SizedBox(height: 15),
          const Text(
            'Thoughts :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  SliverList thoughtsSection() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        var thoughtData = thoughtProvider.thoughts[index];
        return Slidable(
            key: const ValueKey(1),
            direction: Axis.horizontal,
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              ThoughtInit(thoughtId: thoughtData.id))),
                  backgroundColor: const Color.fromARGB(255, 255, 157, 0),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                SlidableAction(
                  onPressed: (context) => thoughtProvider
                      .deleteThought(thoughtData.id)
                      .then((isDeleted) {
                    if (isDeleted!) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${thoughtData.thought} deleted'),
                      ));
                    }
                  }),
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            enabled: true,
            closeOnScroll: true,
            child: Row(
              children: [
                const Text(' -> '),
                Expanded(
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ThoughtInit(thoughtId: thoughtData.id),
                    )),
                    title: Text(thoughtData.thought!),
                  ),
                ),
              ],
            ));
      },
      childCount: thoughtProvider.thoughts.length,
    ));
  }
}

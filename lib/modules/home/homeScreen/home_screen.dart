import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:isar_structure/modules/home/userView/user_view.dart';
import 'package:provider/provider.dart';

import 'package:isar_structure/modules/home/userInit/user_init.dart';
import 'package:isar_structure/providers/user.dart';
import 'package:isar_structure/services/inject.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = serviceLocator.get<UserProvider>();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              floating: true,
              stretch: true,
              snap: true,
              expandedHeight: 90,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Isar Structure'),
                centerTitle: true,
              ),
            ),
            Consumer<UserProvider>(
              builder: (_, __, ___) {
                return userProvider.userList.isEmpty
                    ? const SliverFillRemaining(
                        child: Center(
                        child: Text('No users found'),
                      ))
                    : SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                        var user = userProvider.userList[index];
                        return Slidable(
                            key: const ValueKey(0),
                            direction: Axis.horizontal,
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (context) =>
                                              UserInit(userId: user.id))),
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 157, 0),
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  label: 'Edit',
                                ),
                                SlidableAction(
                                  onPressed: (context) => userProvider
                                      .deleteUser(user.id)
                                      .then((isDeleted) {
                                    if (isDeleted!) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('${user.name} deleted'),
                                      ));
                                    }
                                  }),
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                                // SlidableAction(
                                //   onPressed: (context) =>
                                //       ScaffoldMessenger.of(context)
                                //           .showSnackBar(SnackBar(
                                //               content:
                                //                   Text(user.name.toString()))),
                                //   backgroundColor: const Color(0xFF21B7CA),
                                //   foregroundColor: Colors.white,
                                //   icon: Icons.snapchat,
                                //   label: 'Snackbar',
                                // ),
                              ],
                            ),
                            enabled: true,
                            closeOnScroll: true,
                            child: ListTile(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserView(userId: user.id),
                              )),
                              leading: Text(user.id.toString()),
                              title: Text(user.name.toString()),
                              trailing: Text(user.age.toString()),
                            ));
                      }, childCount: userProvider.userList.length));
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const UserInit(),
          )),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

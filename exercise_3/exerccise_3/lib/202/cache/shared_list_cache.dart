import 'package:exerccise_3/202/cache/shared_learn_cache.dart';
import 'package:exerccise_3/202/cache/shared_manager.dart';
import 'package:exerccise_3/202/cache/useer_cache/user_cache_manager.dart';
import 'package:exerccise_3/202/cache/useer_cache/user_model.dart';
import 'package:flutter/material.dart';

class SharedListCacheView extends StatefulWidget {
  const SharedListCacheView({super.key});

  @override
  State<SharedListCacheView> createState() => _SharedListCacheViewState();
}

class _SharedListCacheViewState extends LoadingStateFull<SharedListCacheView> {
  late final UserCacheManager userCacheManager;
  List<User> _users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeAndSave();
  }

  void initializeAndSave() {
    changeLoading();
    final SharedManager _manager = SharedManager();

    _manager.init().whenComplete(() {
      userCacheManager = UserCacheManager(_manager);
      _users = userCacheManager.GetStrings() ?? [];
    });
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: isLoading
            ? null
            : [
                IconButton(
                  onPressed: () {
                    userCacheManager.saveItems(_users);
                  },
                  icon: Icon(Icons.file_download_done_outlined),
                ),
              ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    super.key,
    required this.users,
  });
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ''),
            subtitle: Text(users[index].description ?? ''),
            trailing: Text(
              users[index].url ?? '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
            ),
          ),
        );
      },
    );
  }
}

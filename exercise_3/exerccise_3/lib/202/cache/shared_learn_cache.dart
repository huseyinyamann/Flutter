// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exerccise_3/202/cache/shared_manager.dart';
import 'package:exerccise_3/202/cache/useer_cache/user_model.dart';
import 'package:flutter/material.dart';

class SharedLearnCacheView extends StatefulWidget {
  const SharedLearnCacheView({super.key});

  @override
  State<SharedLearnCacheView> createState() => _SharedLearnCacheViewState();
}

class _SharedLearnCacheViewState
    extends LoadingStateFull<SharedLearnCacheView> {
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> userItems;

  @override
  void initState() {
    // TODO: implement initState
    _manager = SharedManager();
    userItems = UserItems().users;
    getDefaultValues();
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
  }

  Future<void> getDefaultValues() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangedValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangedValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    } else {
      _currentValue = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _currentValue.toString(),
          ),
          actions: [
            !isLoading
                ? SizedBox.shrink()
                : Center(
                    child: CircularProgressIndicator(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ))
          ],
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _saveValueMethod(),
            _removeValueMethod(),
          ],
        ),
        body: Expanded(child: _UserListView()));
  }

  FloatingActionButton _saveValueMethod() {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: () async {
        changeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setInt('counter', _currentValue);
        _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueMethod() {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () async {
        changeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.remove('counter');

        _manager.removeItem(SharedKeys.counter);

        final int? counter =
            int.tryParse(_manager.getString(SharedKeys.counter) ?? '0') ?? 0;

        setState(() {
          _onChangedValue(counter.toString() ?? '');
        });

        changeLoading();
      },
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    super.key,
  });
  final List<User> users = UserItems().users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text('users[index].name'),
            subtitle: Text('users[index].description'),
            trailing: Text(
              'users[index].url',
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

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('hy', '10', 'hy10dev'),
    ];
  }
}

// Generic
abstract class LoadingStateFull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

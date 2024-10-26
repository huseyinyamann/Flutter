import 'dart:convert';

import 'package:exerccise_3/202/cache/shared_manager.dart';
import 'package:exerccise_3/202/cache/useer_cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  void saveItems(List<User> items) {
    //Compute?
    final _items =
        items.map((element) => jsonEncode(element.toJson())).toList();
    sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? GetStrings() {
    final itemsString = sharedManager.GetStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty == false) {
      return itemsString!.map((element) {
        final jsonObject = jsonDecode(element);
        if (jsonObject is Map<String, dynamic>) {
          return User.fromJson(jsonObject);
        }
        return User('name', 'description', 'url');
      }).toList();
    }
    return null;
  }
}

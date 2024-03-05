import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_template/models/user_model/user_list.dart';
import 'package:my_template/services/user_services/user_services.dart';

final userServiceProvider = Provider<UserService>((ref) => UserService());

final userListProvider = FutureProvider<List<UserList>?>((ref) async {
  return ref.read(userServiceProvider).getUserList();
});

final userInfoProvider =
    FutureProvider.family<UserList?, String>((ref, userId) {
  return ref.read(userServiceProvider).getUserInfo(userId);
});

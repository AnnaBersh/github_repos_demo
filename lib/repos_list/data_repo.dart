import 'dart:async';

import '../api/api_manager.dart';
import '../db.dart';
import '../model/repos_list_response.dart';

class DataRepo {
  final MyDatabase db = MyDatabase();

  Future<List<Repo>> getLocalRepos() {
    return db.allRepos;
  }

  Future<ReposListResponse> getRemoteRepos(String userName) {
    return getReposList(userName: userName);
  }

  Future<void> saveReposList(List<Repo> repos) async {
    await db.insertRepos(repos);
  }

  Future<void> clearReposDb() async {
    await db.clearRepos();
  }

  void close() {
    db.close();
  }
}

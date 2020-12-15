import 'dart:io';

import 'package:github_repos_demo/model/db/repo.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Repos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Repo>> get allRepos => select(repos).get();

  Future<void> clearRepos() {
    return delete(repos).go();
  }

  Future<void> insertRepos(List<Repo> reposList) async {
    await batch((batch) {
      batch.insertAll(repos, reposList);
    });
  }
}

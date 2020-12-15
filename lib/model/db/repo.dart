
import 'package:moor/moor.dart';

class Repos extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get htmlUrl => text()();
}
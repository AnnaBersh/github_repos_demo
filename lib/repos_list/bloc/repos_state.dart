import 'package:github_repos_demo/db.dart';

abstract class ReposState {}

class ReposInitialState extends ReposState {
  String userName;

  ReposInitialState(this.userName);
}

class ReposSuccessState extends ReposState {
  final List<Repo> repos;
  String userName;

  ReposSuccessState(this.repos, this.userName);
}

class ReposLoadingState extends ReposState {}

class ReposErrorState extends ReposState {
  final String errorMessage;

  ReposErrorState(this.errorMessage);
}

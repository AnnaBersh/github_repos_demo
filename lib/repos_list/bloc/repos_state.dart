import 'package:github_repos_demo/model/github_repo.dart';

abstract class ReposState {}

class ReposInitialState extends ReposState {}

class ReposSuccessState extends ReposState {
  final List<GitHubRepo> repos;

  ReposSuccessState(this.repos);
}

class ReposLoadingState extends ReposState {}

class ReposErrorState extends ReposState {
  final String errorMessage;

  ReposErrorState(this.errorMessage);
}

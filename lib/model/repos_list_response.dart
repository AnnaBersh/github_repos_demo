import 'package:github_repos_demo/model/github_repo.dart';

class ReposListResponse {
  List<GitHubRepo> reposList;
  bool isSuccess;
  String error;

  ReposListResponse(this.isSuccess, {this.reposList, this.error});
}

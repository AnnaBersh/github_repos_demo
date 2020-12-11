import 'dart:convert';

import 'package:github_repos_demo/model/github_repo.dart';
import 'package:github_repos_demo/model/repos_list_response.dart';
import 'package:http/http.dart' as http;

Future<ReposListResponse> getReposList({String userName: "AnnaBersh"}) async {
  String url = 'https://api.github.com/users/$userName/repos';
  final response = await http.get(url);
  ReposListResponse result;
  if (response.statusCode == 200) {
    List reposJson = jsonDecode(response.body) as List;
    result = ReposListResponse(true, reposList: reposJson.map((json) => GitHubRepo.fromJson(json)).toList());
  } else {
    result = ReposListResponse(false, error: jsonDecode(response.body)['message'] ?? "Error message not found");
  }
  return result;
}

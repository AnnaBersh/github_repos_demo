import 'package:bloc/bloc.dart';
import 'package:github_repos_demo/api/api_manager.dart';
import 'package:github_repos_demo/db.dart';
import 'package:github_repos_demo/model/github_repo.dart';
import 'package:github_repos_demo/model/repos_list_response.dart';
import 'package:github_repos_demo/repos_list/bloc/repos_state.dart';
import 'package:github_repos_demo/shared_prefs_manager.dart';

import '../data_repo.dart';

class ReposCubit extends Cubit<ReposState> {
  DataRepo repo = DataRepo();
  SharedPrefsManager prefsManager = SharedPrefsManager();

  ReposCubit() : super(ReposLoadingState()) {
    repo.getLocalRepos().then((List<Repo> localRepos) async {
      if (localRepos != null && localRepos.isNotEmpty) {
        emit(ReposSuccessState(localRepos, await prefsManager.getSavedUserName()));
      } else {
        emit(ReposInitialState(await prefsManager.getSavedUserName()));
      }
    });
  }

  void search(String userName) async {
    emit(ReposLoadingState());

    if (await prefsManager.getSavedUserName() == userName) {
      List<Repo> local = await repo.getLocalRepos();
      if (local != null && local.isNotEmpty) {
        emit(ReposSuccessState(local, userName));
      }
    }

    getReposList(userName: userName).then((ReposListResponse response) async {
      if (response.isSuccess) {
        List<Repo> remoteRepos = response.reposList
            .map((GitHubRepo jsonRepo) => Repo(id: jsonRepo.id, name: jsonRepo.name, htmlUrl: jsonRepo.htmlUrl))
            .toList();
        await repo.clearReposDb();
        await repo.saveReposList(remoteRepos);
        prefsManager.saveUserName(userName);
        emit(ReposSuccessState(remoteRepos, userName));
      } else {
        emit(ReposErrorState(response.error));
      }
    });
  }

  @override
  Future<void> close() {
    repo.close();
    return super.close();
  }
}

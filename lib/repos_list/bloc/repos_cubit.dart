import 'package:bloc/bloc.dart';
import 'package:github_repos_demo/api/api.dart';
import 'package:github_repos_demo/model/repos_list_response.dart';
import 'package:github_repos_demo/repos_list/bloc/repos_state.dart';

class ReposCubit extends Cubit<ReposState> {
  ReposCubit() : super(ReposInitialState());

  void search(String userName) async {
    emit(ReposLoadingState());
    ReposListResponse response = await getReposList(userName: userName);
    if (response.isSuccess) {
      emit(ReposSuccessState(response.reposList));
    } else {
      emit(ReposErrorState(response.error));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_repos_demo/model/github_repo.dart';
import 'package:github_repos_demo/repos_list/bloc/repos_state.dart';

import 'bloc/repos_cubit.dart';

class ReposListView extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController(text: "AnnaBersh");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub repos list')),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: BlocBuilder<ReposCubit, ReposState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ReposInitialState:
                    return _buildInitialState(context);
                    break;
                  case ReposLoadingState:
                    return _buildLoadingState();
                    break;
                  case ReposSuccessState:
                    return _buildList(context, (state as ReposSuccessState).repos);
                    break;
                  case ReposErrorState:
                    Fluttertoast.showToast(
                        msg: (state as ReposErrorState).errorMessage, toastLength: Toast.LENGTH_LONG, fontSize: 16.0);
                    return _buildInitialState(context);
                    break;
                  default:
                    return _buildInitialState(context);
                }
              },
            ),
          )),
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Column(children: _buildSearchForm(context));
  }

  Widget _buildLoadingState() {
    return CircularProgressIndicator();
  }

  List<Widget> _buildSearchForm(BuildContext context) {
    return [
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'GitHub user name',
        ),
        controller: _userNameController,
      ),
      TextButton(
          child: Text("Search"),
          onPressed: () {
            context.read<ReposCubit>().search(_userNameController.text);
          })
    ];
  }

  Widget _buildList(BuildContext context, List<GitHubRepo> repos) {
    List<Widget> widgets = _buildSearchForm(context);
    widgets.add(new Expanded(
      child: ListView.builder(
          itemCount: repos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${repos[index].name}'),
              subtitle: Text('${repos[index].htmlUrl}'),
            );
          }),
    ));
    return Column(
      children: widgets,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_demo/repos_list/bloc/repos_cubit.dart';
import 'package:github_repos_demo/repos_list/repos_list_view.dart';

class ReposListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReposCubit(),
      child: ReposListView(),
    );
  }
}

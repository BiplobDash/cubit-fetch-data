import 'package:cubit_rest_api/cubit/user_cubit.dart';
import 'package:cubit_rest_api/cubit/user_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getAllUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Api using Cubit'),
        centerTitle: true,
      ),
      body: BlocBuilder<UserCubit, UserCubitState>(builder: (_, state) {
        if (state is UserCubitLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserCubitError) {
          return Center(
            child: Text(state.message.toString()),
          );
        } else if (state is UserCubitDataLoaded) {
          return ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (_, index) {
                Users users = state.userList[index];
                return ListTile(
                  leading: Text(users.id.toString(), style: const TextStyle(color: Colors.black),),
                );
              });
        } else {
          return const Text('Nothing Show');
        }
      }),
    );
  }
}

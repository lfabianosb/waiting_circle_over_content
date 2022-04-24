import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),
      body: const PageView(),
    );
  }
}

class PageView extends StatelessWidget {
  const PageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          final snackBar = SnackBar(
            content: Text(state.message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          final users = BlocProvider.of<HomeCubit>(context).state.users;
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(users[index].photo),
                          ),
                          title: Text(users[index].name),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: BlocProvider.of<HomeCubit>(context)
                              .loadWithoutError,
                          child: const Text('Load without error')),
                      ElevatedButton(
                          onPressed:
                              BlocProvider.of<HomeCubit>(context).loadWithError,
                          child: const Text('Load with error')),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                color: const Color(0xFF999999).withOpacity(0.6),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        }
        final users = BlocProvider.of<HomeCubit>(context).state.users;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(users[index].photo),
                    ),
                    title: Text(users[index].name),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed:
                        BlocProvider.of<HomeCubit>(context).loadWithoutError,
                    child: const Text('Load without error')),
                ElevatedButton(
                    onPressed:
                        BlocProvider.of<HomeCubit>(context).loadWithError,
                    child: const Text('Load with error')),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        );
      },
    );
  }
}

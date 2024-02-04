import 'package:bloc_example_1/bloc/posts/posts_bloc.dart';
import 'package:bloc_example_1/bloc/posts/posts_events.dart';
import 'package:bloc_example_1/bloc/posts/posts_states.dart';
import 'package:bloc_example_1/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreens extends StatefulWidget {
  const PostScreens({super.key});

  @override
  State<PostScreens> createState() => _PostScreensState();
}

class _PostScreensState extends State<PostScreens> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostsFetchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PostBloc, PostStates>(
          builder: (context, state) {
            switch (state.status) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());
              case Status.error:
                return const Center(child: Text('Something went wrong'));
              case Status.success:
                return ListView.builder(
                  itemCount: state.postList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        state.postList[index].name.toString(),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        state.postList[index].body.toString(),
                        textAlign: TextAlign.justify,
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

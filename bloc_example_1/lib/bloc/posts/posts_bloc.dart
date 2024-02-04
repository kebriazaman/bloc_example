import 'package:bloc/bloc.dart';
import 'package:bloc_example_1/bloc/posts/posts_events.dart';
import 'package:bloc_example_1/bloc/posts/posts_states.dart';
import 'package:bloc_example_1/models/posts_model.dart';

import '../../repository/post_repository.dart';
import '../../utils/enums.dart';

class PostBloc extends Bloc<PostsEvent, PostStates> {
  List<PostsModel> postList = [];
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostStates()) {
    on<PostsFetchedEvent>((event, emit) async {
      postList = await postRepository.fetchPosts();
      if (postList.isNotEmpty) {
        emit(state.copyWith(status: Status.success, postList: postList, message: 'success'));
      } else {
        emit(state.copyWith(status: Status.error, postList: postList, message: 'error'));
      }
    });
  }
}

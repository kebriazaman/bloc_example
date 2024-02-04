import 'package:bloc_example_1/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../models/posts_model.dart';

class PostStates extends Equatable {
  final Status status;
  final List<PostsModel> postList;
  final String message;

  // initial states
  const PostStates({
    this.status = Status.loading,
    this.postList = const <PostsModel>[],
    this.message = '',
  });

  // new states

  PostStates copyWith({Status? status, List<PostsModel>? postList, String? message}) {
    return PostStates(
      status: status ?? this.status,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, postList, message];
}

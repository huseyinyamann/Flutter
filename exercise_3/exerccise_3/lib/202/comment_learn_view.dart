// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exerccise_3/202/comment_model.dart';
import 'package:exerccise_3/202/post_service.dart';
import 'package:flutter/material.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({
    Key? key,
    required this.postId,
  }) : super(key: key);
  final int? postId;

  @override
  State<CommentLearnView> createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {
  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentsItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postService = PostService();
    fetchItemsWitchId(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWitchId(int postId) async {
    _changeLoading();
    _commentsItem = await postService.fetchReletedCommentWithPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _commentsItem?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Text(_commentsItem?[index].body ?? ''),
            );
          }),
    );
  }
}

import 'package:exerccise_3/202/comment_learn_view.dart';
import 'package:exerccise_3/202/post_model.dart';
import 'package:exerccise_3/202/post_service.dart';
import 'package:flutter/material.dart';

class ServiceLearnView extends StatefulWidget {
  const ServiceLearnView({super.key});
  @override
  State<ServiceLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceLearnView> {
  List<PostModel>? _items;
  // TEST EDİLEBİLİR KOD BAŞLADI
  late final IPostService _postService;
  bool _isLoading = false;
  @override
  void initState() {
    _postService = PostService();
    fetchPostItems();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    changeLoading();
    _items = await _postService.fetchPostItems();
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListItems'),
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? Placeholder()
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(
                  model: _items?[index],
                );
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentLearnView(postId: _model?.id),
          ));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}

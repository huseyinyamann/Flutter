import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exerccise_3/202/comment_model.dart';
import 'package:exerccise_3/202/post_model.dart';
import 'package:flutter/foundation.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItems();
  Future<List<CommentModel>?> fetchReletedCommentWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response =
          await _dio.post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return false;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response =
          await _dio.put('${_PostServicePaths.posts.name}/$id', data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.delete('${_PostServicePaths.posts.name}/$id');

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItems() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }

    return null;
  }

  @override
  Future<List<CommentModel>?> fetchReletedCommentWithPostId(int postId) async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name,
          queryParameters: {_PostQueryPaths.postId.name: postId});
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (e) {
      _ShowDebug.showDioError(e, this);
    }

    return null;
  }
}

enum _PostServicePaths { posts, comments }

enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print('${type}');
    }
  }
}

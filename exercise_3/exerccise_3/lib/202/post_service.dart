import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exerccise_3/202/post_model.dart';
import 'package:flutter/foundation.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItems();
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
          await _dio.post(_PostServicePaths.post.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e);
    }
    return false;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response =
          await _dio.put('${_PostServicePaths.post.name}/$id', data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.delete('${_PostServicePaths.post.name}/$id');

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (e) {
      _ShowDebug.showDioError(e);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItems() async {
    try {
      final response = await _dio.get(_PostServicePaths.post.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (e) {
      _ShowDebug.showDioError(e);
    }

    return null;
  }
}

enum _PostServicePaths { post, comments }

class _ShowDebug {
  static void showDioError(DioError error) {
    if (kDebugMode) {
      print('Hata: ${error}');
    }
  }
}

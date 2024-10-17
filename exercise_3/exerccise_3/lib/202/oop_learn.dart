// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:exerccise_3/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  Future<void> toShare(String path) async {
    final Uri uri = Uri.parse(path);
    await launchUrl(uri);
  }
}

class FileDownload extends IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    return true;
  }

  void smsShare(params) {
    
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(
    this.name,
    this.file,
  );
}

mixin ShareMixin on IFileDownload{
  void toShowFile() {}
}
import 'dart:async';
import 'dart:math';
import '../model/lab5_model.dart';

class DownloadViewModel {
  final List<StreamController<DownloadProgress>> progressControllers =
  List.generate(10, (_) => StreamController<DownloadProgress>());

  List<Stream<DownloadProgress>> get progressStreams =>
      progressControllers.map((controller) => controller.stream).toList();

  Future<void> downloadFile(int index, StreamController<DownloadProgress> controller) async {
    final random = Random();
    final totalDuration = random.nextInt(6) + 10;

    for (int elapsed = 0; elapsed <= totalDuration; elapsed++) {
      await Future.delayed(Duration(seconds: 1));
      final progress = (elapsed / totalDuration) * 100;
      controller.add(DownloadProgress(index: index, progress: progress));
    }

    controller.close();
  }

  void startDownload() {
    for (var i = 0; i < progressControllers.length; i++) {
      downloadFile(i, progressControllers[i]);
    }
  }

  void dispose() {
    for (var controller in progressControllers) {
      controller.close();
    }
  }
}

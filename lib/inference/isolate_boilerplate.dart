import 'dart:async';
import 'dart:isolate';
import 'package:async/async.dart';

class Inferencer {
  late SendPort workerPort;
  final Completer<void> _isolateReady = Completer.sync();

  Future<void> spawn() async {
    final receivePort = ReceivePort();
    receivePort.listen(handleMessage);
    await Isolate.spawn(startIsolate, receivePort.sendPort);
  }

  Future<void> handleMessage(dynamic message) async{
    if (message is SendPort) {
      workerPort = message;
      _isolateReady.complete();
    }
    else if(message is String){ // TODO: add custom typing?
      print("from isolate:");
      print(message);
    }
  }

  static void startIsolate(SendPort port) {
    final workerPort = ReceivePort();
    port.send(workerPort.sendPort); // send back to parent

    workerPort.listen((dynamic msg) async {
      if (msg is! String) {
        // WARNING: unreachable!
      } else {
        print("doing some work");
        await Future.delayed(Duration(seconds:2));
        port.send(msg);
      }
    });
  }

  Future<void> chat(String prompt) async {
    await _isolateReady.future;
    workerPort.send(prompt);
  }
}

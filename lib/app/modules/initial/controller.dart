import 'dart:async';

import 'package:flutter/services.dart';
import 'package:minimals_state_manager/app/state_manager/controller/min_controller.dart';

class InitialController extends MinController {
  //Event Channel creation
  static const stream =
      EventChannel('byebnk.com.example.deeplink_native/events');

  //Method channel creation
  static const platform =
      MethodChannel('byebnk.com.example.deeplink_native/channel');

  StreamController<String> _stateController = StreamController();

  Stream<String> get state => _stateController.stream;

  Sink<String> get stateSink => _stateController.sink;

  //Adding the listener into contructor
  InitialController() {
    //Checking application start by deep link
    startUri().then((uri) => _onRedirected(uri));
    //Checking broadcast stream, if deep link was clicked in opened appication
    stream.receiveBroadcastStream().listen((d) => _onRedirected(d));
  }

  _onRedirected(String uri) {
    print(uri);
    // Here can be any uri analysis, checking tokens etc, if it’s necessary
    // Throw deep link URI into the BloC's stream
    stateSink.add(uri);
  }

  @override
  void onClose() {
    _stateController.close();
  }

  Future<dynamic> startUri() async {
    try {
      return platform.invokeMethod('initialLink');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }
}

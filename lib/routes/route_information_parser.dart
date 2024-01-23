import 'package:flutter/material.dart';

class MyRouteInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) {
    // print(' --- ${routeInformation.location} --- ');
    return Future.value(
      routeInformation.uri,
    );
  }

  @override
  RouteInformation? restoreRouteInformation(Uri configuration) {
    return RouteInformation(
      uri: Uri.parse(configuration.toString()),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:plugin_stream/plugin_stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _pluginStreamPlugin = PluginStream();
  int _counter = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    _pluginStreamPlugin.getData().listen((event) {
      setState(() {
        _counter = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_counter\n'),
        ),
      ),
    );
  }
}

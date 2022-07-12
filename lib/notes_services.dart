import 'package:flutter/material.dart';
import 'package:d_app/note.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class NotesServices extends ChangeNotifier {
  List<Note> notes = [];
  final String _rpcUrl = 'HTTP://127.0.0.1:7545';
  final String _wsUrl = 'ws://127.0.0.1:7545';
  final String _privatekey =
      '0ca837c71da9b90299d43f7b9251073ef599740d9b34b75faa562784d0433cd0';
  late Web3Client _web3client;
  NotesServices() {
    init();
  }
  Future<void> init() async {
    _web3client = Web3Client(
      _rpcUrl,
      http.Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsUrl).cast<String>();
      },
    );
  }

  Future<void> getABI() async {}
}

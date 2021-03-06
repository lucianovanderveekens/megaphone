import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:vocab/deck/deck_storage.dart';
import 'package:vocab/secret/secrets.dart';
import 'package:vocab/camera/text_decorator_painter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DeckPage extends StatefulWidget {
  final DeckStorage deckStorage;

  const DeckPage({Key? key, required this.deckStorage}) : super(key: key);

  @override
  State<DeckPage> createState() => DeckPageState();
}

class DeckPageState extends State<DeckPage> {
  List<String> wordList = [];

  @override
  void initState() {
    super.initState();
    widget.deckStorage.findAll().then((value) {
      setState(() {
        wordList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: wordList.map((value) {
          return Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(5.0),
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Center(child: Text(value)));
        }).toList(),
      )),
    );
  }
}

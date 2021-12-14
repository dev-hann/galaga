import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'galaga_game.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GameWidget(
      game: Galaga(),
    ),
  );
}

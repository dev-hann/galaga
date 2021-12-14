import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _Knob extends PositionComponent {
  _Knob({required this.radius});

  final double radius;

  @override
  void render(Canvas canvas) {
    canvas.translate(-radius / 2, -radius / 2);
    canvas.drawCircle(
      center.toOffset(),
      radius,
      Paint()..color = Colors.white.withOpacity(.3),
    );
  }
}

class Joystick extends JoystickComponent {
  Joystick({
    required this.onChangedDirection,
    required Vector2 position,
  }) : super(
          knob: _Knob(radius: 30),
          // background: _Knob(radius: 40),
          size: 30,
          position: position,
        );

  final Function(JoystickDirection direction) onChangedDirection;

  double get knobAngle{
    var knobAngle = delta.screenAngle();
    // Since screenAngle and angleTo doesn't care about "direction" of the angle
    // we have to use angleToSigned and create an only increasing angle by
    // removing negative angles from 2*pi.
    knobAngle = knobAngle < 0 ? 2 * pi + knobAngle : knobAngle;
    return knobAngle;
  }

  @override
  bool onDragUpdate(int _, DragUpdateInfo info) {
    return super.onDragUpdate(_, info);
  }

  @override
  void update(double dt) {
    onChangedDirection(direction);
    print(knobAngle);
    super.update(dt);
  }

}

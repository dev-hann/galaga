import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:galaga/components/joystick/button.dart';
import 'package:galaga/components/ship.dart';

class Galaga extends FlameGame with HasDraggables, HasTappables {
  late final Ship _ship = Ship(position: size/2);

  void _shipPositionUpdate(JoystickDirection direction) {
    _ship.updateDirection(direction);
  }

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    add(_ship);
    add(
      Joystick(
        onChangedDirection: _shipPositionUpdate,
        position: size / 2,
      ),
    );
  }

  @override
  void update(double dt) {

    super.update(dt);
  }
}

import 'package:flame/components.dart';
import 'package:flame/input.dart';

enum DragDirection {
  left,
  right,
}

class Ship extends SpriteComponent {
  Ship({Vector2? position}) : super(position: position);
  DragDirection? _dragDirection;

  Vector2 get _spritePosition {
    switch (_dragDirection) {
      case DragDirection.left:
        return Vector2(9, 1);
      case DragDirection.right:
        return Vector2(17, 1);
      default:
        return Vector2(0, 1);
    }
  }

  Vector2 get _spriteSize {
    switch (_dragDirection) {
      case DragDirection.left:
      case DragDirection.right:
        return Vector2(7, 15);
      default:
        return Vector2(8, 15);
    }
  }

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load(
      'tileset.png',
      srcPosition: _spritePosition,
      srcSize: _spriteSize,
    );
    size = sprite!.srcSize * 3;
    anchor = Anchor.center;
    return super.onLoad();
  }

  void updateDirection(JoystickDirection direction) {
    double acc = 3;
    Vector2 _delta = Vector2(0, 0);
    void _up() {
      _delta.y -= acc;
    }

    void _down() {
      _delta.y += acc;
    }

    void _left() {
      _delta.x -= acc;
    }

    void _right() {
      _delta.x += acc;
    }

    switch (direction) {
      case JoystickDirection.up:
        _up();
        break;
      case JoystickDirection.upLeft:
        _up();
        _left();
        break;

      case JoystickDirection.upRight:
        _up();
        _right();
        break;

      case JoystickDirection.right:
        _right();
        break;
      case JoystickDirection.down:
        _down();
        break;
      case JoystickDirection.downRight:
        _down();
        _right();
        break;
      case JoystickDirection.downLeft:
        _down();
        _left();
        break;
      case JoystickDirection.left:
        _left();
        break;
      case JoystickDirection.idle:
        break;
    }
    position.add(_delta);
  }

  @override
  void update(double dt) {
    sprite!.srcPosition = _spritePosition;
    sprite!.srcSize = _spriteSize;
    super.update(dt);
  }

// @override
// bool onDragUpdate(int pointerId, DragUpdateInfo info) {
//   final delta = info.delta.game;
//   final double x = delta.x;
//   if (x < 0) {
//     _dragDirection = DragDirection.left;
//   } else if (x > 0) {
//     _dragDirection = DragDirection.right;
//   } else {
//     _dragDirection = null;
//   }
//   position += delta;
//   return super.onDragUpdate(pointerId, info);
// }

// @override
// bool onDragEnd(int pointerId, DragEndInfo info) {
//   _dragDirection = null;
//
//   return super.onDragEnd(pointerId, info);
// }
}

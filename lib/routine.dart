void main() {
  final me = Me();
  while (me.isAlive) {
    me.wakeUp();
    me.eat();

    if (DateTime.now().weekday < 6 || me.tired) {
      me.work();
    } else {
      me.goWalk();
    }

    me.eat();
    me.sleep();
  }
}

class Me {
  bool tired = false;
  bool isAlive = true;

  void wakeUp() {}
  void eat() {}

  void sleep() {
    tired = false;
  }

  void work() {
    tired = true;
  }

  void goWalk() {
    tired = false;
  }
}

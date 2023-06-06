void main() {
  final truck = Truck.withColor(Colors.blue);
  final sportCar = Sportcar(Colors.green);
  final bike = Bike(Colors.red);

  print(truck);
  print(sportCar);
  print(bike);

  truck.run();
  sportCar.run();
}

abstract class Car {
  double weight = 0;

  void run();
}

class Truck extends Car with Painter, Engine {
  @override
  double get weight => 10;

  Truck() {}

  Truck.withColor(Colors color) {
    setColor(color);
  }

  @override
  void run() {
    runEngine();
  }

  @override
  String toString() {
    return "Грузовик $colorName цвета";
  }
}

class Sportcar extends Car with Painter, Engine {
  @override
  double get weight => 2;

  Sportcar(Colors color) {
    setColor(color);
  }

  @override
  void run() {
    runEngine();
  }

  @override
  String toString() {
    return "Спорткар $colorName цвета";
  }
}

class Bike with Painter {
  Bike(Colors color) {
    setColor(color);
  }

  @override
  String toString() {
    return "Велосипед $colorName цвета";
  }
}

enum Colors { red, green, blue }

mixin Painter {
  String colorName = "unknown";

  void setColor(Colors color) {
    switch (color) {
      case Colors.red:
        colorName = "red";
        break;
      case Colors.green:
        colorName = "green";
        break;
      case Colors.blue:
        colorName = "blue";
        break;
    }
  }
}

mixin Engine on Car {
  int enginePower = 1;

  void runEngine() {
    print("Двигатель работает. Максимальная скорость = ${enginePower / weight}.");
  }
}

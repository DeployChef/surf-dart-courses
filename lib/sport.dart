void main() {
  var team = Team(name: "MyTeam");
  var coach = Coach(name: "Coach Bob", trophies: ["Best of the best", "Good job", "Oscar"]);
  team.coach = coach;
  team.addMember(Gamer(
    name: "Arthur",
    role: Role.carry,
    matchesCount: 10,
  ));
  team.addMember(Gamer(
    name: "Mark",
    role: Role.mid,
    matchesCount: 5,
  ));
  team.addMember(Gamer(name: "Gaben", role: Role.offlane));

  team.showResults();
}

abstract class Human {
  String name;

  Human(this.name);

  String represent();
}

class Gamer extends Human {
  int _matchesCount = 0;
  Role role;

  Gamer({required String name, required this.role, int matchesCount = 0}) : super(name) {
    _matchesCount = matchesCount;
  }

  void play() {
    _matchesCount++;
  }

  @override
  String represent() {
    return "Name is $name, $_matchesCount matches played, Role is ${role.name}";
  }
}

enum Role { carry, mid, offlane }

class Coach extends Human {
  List<String> _trophies = [];

  Coach({required String name, List<String>? trophies}) : super(name) {
    _trophies = trophies ?? [];
  }

  @override
  String represent() {
    var trophiesStr = _trophies.isNotEmpty ? "Have trophies: ${_trophies.join(", ")}" : "Does not have any trophies";
    return "Name is $name, $trophiesStr";
  }
}

class Team {
  final String name;
  Coach? coach;
  final List<Gamer> _gamers = [];
  List<Gamer> get gamers => _gamers.toList();

  Team({required this.name});

  void addMember(Gamer gamer) {
    _gamers.add(gamer);
  }

  void removeMember(Gamer gamer) {
    _gamers.remove(gamer);
  }

  void showResults() {
    print("Team name is $name");
    if (coach != null) {
      print("Coach ${coach!.represent()}");
    } else {
      print("Without coach");
    }
    print("Team members:");
    for (var element in _gamers) {
      print(element.represent());
    }
  }
}

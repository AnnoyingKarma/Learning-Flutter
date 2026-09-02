class Player{
  String name;
  int life;

  Player({
    required this.name,
    required this.life,
  });

  Map<String, dynamic> toMap(){
    return{
      'name' : name,
      'life' : life,
    };
  }
  
  factory Player.fromMap(Map<String, dynamic> map){
    return Player(
      name : map['name'],
      life : map['life'],
    );
  }
}
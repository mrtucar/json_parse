class Todo {
  int? id;
  int? kullaniciId;
  String? title;
  bool? completed;

  Todo(this.id,this.title,this.completed,this.kullaniciId);

  Todo.fromJson(Map<String,dynamic> json){
    this.id = json["id"];
    this.kullaniciId = json["kullaniciId"];
    this.title = json["title"];
    this.completed = json["completed"];
  }
  Map<String,dynamic> toJson()
  {
    Map<String,dynamic> nesne = new Map<String,dynamic>();
    nesne["id"] =  this.id;
    nesne["kullaniciId"] =  this.kullaniciId;
    nesne["title"] =  this.title;
    nesne["completed"] =  this.completed;
    return nesne;


  }
}
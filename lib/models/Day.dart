class Day{

  String id;
  String name;

  Day(this.id,this.name);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  Day.fromJson(Map<String, dynamic> json) {
    //this.id       = json['id'];
    this.name     = json['name'];
  }
}
class Command {
  String sId;
  String description;
  String title;

  Command({this.sId, this.description, this.title});

  Command.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }
}
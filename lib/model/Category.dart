class Category {
  String iconPath;
  String sId;
  String title;

  Category({this.iconPath, this.sId, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    iconPath = json['iconPath'];
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iconPath'] = this.iconPath;
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}

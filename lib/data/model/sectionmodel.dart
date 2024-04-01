class SectionModel {
  String? sectionId;
  String? sectionName;
  String? sectionPrice;
  String? sectionDescription;
  String? course;

  SectionModel(
      {this.sectionId,
      this.sectionName,
      this.sectionPrice,
      this.sectionDescription,
      this.course});

  SectionModel.fromJson(Map<String, dynamic> json) {
    sectionId = json['id'];
    sectionName = json['name'];
    sectionDescription = json['description'];
    sectionPrice = json['price'];
    course = json['course'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.sectionId;
    data['name'] = this.sectionName;
    data['description'] = this.sectionDescription;
    data['price'] = this.sectionPrice;
    data['course'] = this.course;
    return data;
  }
}

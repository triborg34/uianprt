class plateModel {
  int? charPercent;
  String? eDate;
  String? eTime;
  String? plateNum;
  int? platePercent;
  int? status;
  String? imgpath;

  plateModel(
      {this.charPercent,
      this.eDate,
      this.eTime,
      this.plateNum,
      this.platePercent,
      this.status,this.imgpath});

  plateModel.fromJson(Map<String, dynamic> json) {
    charPercent = json['charPercent'];
    eDate = json['eDate'];
    eTime = json['eTime'];
    plateNum = json['plateNum'];
    platePercent = json['platePercent'];
    status = json['status'];
    imgpath = json['imgpath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['charPercent'] = this.charPercent;
    data['eDate'] = this.eDate;
    data['eTime'] = this.eTime;
    data['plateNum'] = this.plateNum;
    data['platePercent'] = this.platePercent;
    data['status'] = this.status;
    data['imgpath'] = this.imgpath;
    return data;
  }
}
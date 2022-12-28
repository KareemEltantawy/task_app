class ScanModel {
  int? status;
  String? massage;
  Data? data;


  ScanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['massage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  String? code;
  int? scannerId;
  String? updatedAt;
  String? createdAt;
  int? id;


  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    scannerId = json['scanner_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }


}

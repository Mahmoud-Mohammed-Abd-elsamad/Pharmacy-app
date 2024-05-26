class BranchModel {
  int? branchId;
  String? name;
  String? address;
  String? city;
  String? state;
  int? phoneNumber;

  BranchModel(
      {this.branchId,
        this.name,
        this.address,
        this.city,
        this.state,
        this.phoneNumber});

  BranchModel.fromJson(Map<String, dynamic> json) {
    branchId = json['branchId'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchId'] = this.branchId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

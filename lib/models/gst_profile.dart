class GSTProfile {
  String gstNumber;
  String name;
  String status;
  String address;
  String taxPayerType;
  String businessType;
  DateTime dateOfRegistration;

  GSTProfile.fromJson(Map<String, dynamic> map)
      : gstNumber = map['gstNumber'],
        name = map['name'],
        status = map['status'],
        address = map['address'],
        taxPayerType = map['taxPayerType'],
        businessType = map['businessType'],
        dateOfRegistration = map['dateOfRegistration'];
}

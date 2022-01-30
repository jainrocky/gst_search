class GSTProfile {
  String gstNumber;
  String name;
  String status;
  String principlePlace;
  String additionalPlace;
  String taxPayerType;
  String constitutionOfBusiness;
  String stateJurisdiction;
  String centerJurisdiction;
  DateTime dateOfRegistration;
  DateTime dateOfCancellation;


  GSTProfile.fromJson(Map<String, dynamic> map)
      : gstNumber = map['gstNumber'],
        name = map['name'],
        status = map['status'],
        principlePlace = map['principlePlace'],
        taxPayerType = map['taxPayerType'],
        constitutionOfBusiness = map['constitutionOfBusiness'],
        dateOfRegistration = DateTime.tryParse(map['dateOfRegistration']),
        dateOfCancellation = DateTime.tryParse(map['dateOfCancellation']),
        additionalPlace=map['additionalPlace'],
        centerJurisdiction=map['centerJurisdiction'],
        stateJurisdiction=map['stateJurisdiction'];
}

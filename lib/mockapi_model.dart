class MockApi {
  final String? id;
  final int? Document_No;
  final String? Document_Date;
  final String? Cost_Name;
  final String? Cost_Source;
  final String? Division_Code;
  final int? Qty;
  final String? Unit;
  final int? Price;
  final int? Amount;
  final String? Image_01;
  final String? Image_02;
  final String? Image_03;
  final String? Remarks;
  

  MockApi({
    required this.id,
    required this.Document_No,
    required this.Document_Date,
    required this.Cost_Name,
    required this.Cost_Source,
    required this.Division_Code,
    required this.Qty,
    required this.Unit,
    required this.Price,
    required this.Amount,
    required this.Image_01,
    required this.Image_02,
    required this.Image_03,
    required this.Remarks,
  });

  factory MockApi.fromJson(Map<String, dynamic> json) {
    return MockApi(
      id: json['id'],
      Document_No: json['Document_No'],
      Document_Date: json['Document_Date'],
      Cost_Name: json['Cost_Name'],
      Cost_Source: json['Cost_Source'],
      Division_Code: json['Division_Code'],
      Qty: json['Qty'],
      Unit: json['Unit'],
      Price: json['Price'],
      Amount: json['Amount'],
      Image_01: json['Image_01'],
      Image_02: json['Image_02'],
      Image_03: json['Image_03'],
      Remarks: json['Remarks'],
    );
  }
}

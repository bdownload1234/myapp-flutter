class CostMaster {
  final int? Document_ID;
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
  final int? Fix_Cls;
  final String? Fix_Date;
  final String? Fix_User;
  final String? Update_Date;
  final String? Update_User;
  final String? Entry_Date;
  final String? Entry_User;

  CostMaster({
    required this.Document_ID,
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
    required this.Fix_Cls,
    required this.Fix_Date,
    required this.Fix_User,
    required this.Update_Date,
    required this.Update_User,
    required this.Entry_Date,
    required this.Entry_User,
  });

  factory CostMaster.fromJson(Map<String, dynamic> json) {
    return CostMaster(
      Document_ID: json['Document_ID'],
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
      Fix_Cls: json['Fix_Cls'],
      Fix_Date: json['Fix_Date'],
      Fix_User: json['Fix_User'],
      Update_Date: json['Update_Date'],
      Update_User: json['Update_User'],
      Entry_Date: json['Entry_Date'],
      Entry_User: json['Entry_User'],  
    );
  }
}

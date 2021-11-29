import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/model_cost_master.dart';

class Repository {
  final _baseUrl = 'http://192.168.1.13:45455/';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/api/Cost_Master'));
      if (response.statusCode == 200) {
        //debugPrint(response.body);
        //Hapus tag diatas untuk cek respon
        List<dynamic> costMaster = jsonDecode(response.body)
            .map((e) => CostMaster.fromJson(e))
            .toList();
        //debugPrint(response.body);
        return costMaster;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future postData(
      int Document_No,
      String Document_Date,
      String Cost_Name,
      String Cost_Source,
      String Division_Code,
      int Qty,
      String Unit,
      int Price,
      int Amount,
      String Remarks,
      String Image_01) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + '/api/Cost_Master'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, String>{
          'Document_No': Document_No.toString(),
          'Document_Date': Document_Date.toString(),
          'Cost_Name': Cost_Name,
          'Cost_Source': Cost_Source,
          'Division_Code': Division_Code,
          'Qty': Qty.toString(),
          'Unit': Unit,
          'Price': Price.toString(),
          'Amount': Amount.toString(),
          'Remarks': Remarks,
          'Image_01': Image_01,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future putData(
      int Document_ID,
      int Document_No,
      String Document_Date,
      String Cost_Name,
      String Cost_Source,
      String Division_Code,
      int Qty,
      String Unit,
      int Price,
      int Amount,
      String Remarks,
      String Image_01) async {
    try {
      final response = await http.put(
          Uri.parse(_baseUrl + '/api/Cost_Master/' + Document_ID.toString()),
          headers: {"Content-Type": 'application/json'},
          body: jsonEncode(<String, String>{
            'Document_ID': Document_ID.toString(),
            'Document_No': Document_No.toString(),
            'Document_Date': Document_Date.toString(),
            'Cost_Name': Cost_Name,
            'Cost_Source': Cost_Source,
            'Division_Code': Division_Code,
            'Qty': Qty.toString(),
            'Unit': Unit,
            'Price': Price.toString(),
            'Remarks': Remarks,
            'Image_01' : Image_01
          }));

      if (response.statusCode == 204) {
        return true;
      } else {
        debugPrint(response.body);
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future deleteData(int Document_ID) async {
    try {
      final response = await http
          .delete(Uri.parse(_baseUrl + '/api/Cost_Master/' + Document_ID.toString()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future login(String email, String password) async {
    try {
      final response = await http.get(
          Uri.parse(_baseUrl + "/api/User_Setup/" + email + "/" + password));

      if (response.body.contains(email)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

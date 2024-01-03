import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/modules/navbartabungan/views/navbartabungan_view.dart';
import '../../../config/api.dart';
import '../../tabunganbefore/controllers/tabunganefore_controller.dart';

class InputCodeController extends GetxController {
  final TabunganbeforeController TabunganCtrl = Get.find();

  final GlobalKey<FormState> qradminFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController CodeCtrl = TextEditingController();
  RxInt selectedId = RxInt(0);

  String? validateCode(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Berat Sampah tidak boleh kosong';
    }
    {
      return null;
    }
  }

  Future<void> PostDataCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    final id = selectedId.value;
    final String code = CodeCtrl.text;
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.code_iots);
      var body = {
        "garbage_savings_data_id": id.toString(),
        "code": code,
      };
      print(code);
      print(id);
      https.Response response =
          await https.post(url, body: body, headers: headers);
      var error = jsonDecode(response.body)['message'];
      var succes = jsonDecode(response.body)['message'];

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        customAllertDialog('Sukses', '${succes}', 'succes');
        Timer(Duration(seconds: 2), () {
          Get.toNamed('/navbartabungan', arguments: TabunganCtrl.fetchData());
        });
        //Tambahkan print response.body untuk melihat response dari server
      } else {
        customAllertDialog('Gagal', '${error}', 'error');
      }
    } catch (e) {
      customAllertDialog('Kirim data gagal', e.toString(), 'error');
    }
  }

  void checkIots() async {
    if (qradminFromKey.currentState!.validate()) {
      qradminFromKey.currentState!.save();
      try {
        PostDataCode();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  @override
  void onInit() {
    selectedId.value = Get.arguments as int;
    print(selectedId.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

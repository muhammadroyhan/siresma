import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';
import 'package:siresma/view_models/user/qrcode_view_model.dart';

class Qrcodescreen extends GetView<QrcodeViewModel> {
  const Qrcodescreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 240.0
        : 240.0;
    return GetBuilder<QrcodeViewModel>(
      builder: (controller) {
        return Obx(
          () {
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.qrcode,
                            size: 42.sp,
                            color: primaryColor1,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Setor Sampah',
                                style: AppStyle(
                                  22.sp,
                                  Colors.black,
                                  FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: primaryColor1,
                                ),
                                width: 80.w,
                                height: 5.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      Expanded(
                        flex: 2,
                        child: QRView(
                          key: controller.qrKey,
                          onQRViewCreated: controller.onQRViewCreated,
                          overlay: QrScannerOverlayShape(
                            borderColor: primaryColor1,
                            borderRadius: 10,
                            borderLength: 30,
                            borderWidth: 10,
                            cutOutSize: scanArea,
                          ),
                          onPermissionSet: (ctrl, p) =>
                              controller.onPermissionSet(context, ctrl, p),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Code: ${controller.data}',
                              style: AppStyle(
                                22.sp,
                                Colors.black,
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

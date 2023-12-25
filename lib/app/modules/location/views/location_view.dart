import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/button.dart';

import '../../../common/colors.dart';
import '../../../common/custom_textformfield.dart';
import '../../../models/dropdown_location.dart';
import '../../../models/user.dart';
import '../../profil/controllers/profil_controller.dart';
import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    final ProfilController ProfilCtrl = Get.put(ProfilController());

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        controller.update();
        return Scaffold(
          appBar: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Transform.scale(
                            scale: 1.55,
                            child: "${ProfilCtrl.profil_picture.value}" != null
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey.shade400,
                                    backgroundImage: NetworkImage(
                                      "${ProfilCtrl.profil_picture.value}",
                                      scale: 1.0,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.grey.shade400,
                                    child: Icon(FontAwesomeIcons.solidUser,
                                        color: Colors.grey.shade300),
                                  ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQueryWidth * 0.06,
                        ),
                        Text(
                          'SIRESMA',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(MediaQueryHeight * 0.13),
          ),
          body: Container(
            height: MediaQueryHeight,
            width: MediaQueryWidth,
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText(
                      "Pilih Bank Sampah",
                      Colors.black,
                      17,
                      FontWeight.bold,
                    ),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: primary,
                      ),
                      width: MediaQueryWidth * 0.2,
                      height: 5,
                    ),
                    SizedBox(
                      height: MediaQueryHeight * 0.03,
                    ),
                    DropdownButtonFormField<RTModel>(
                      value: null,
                      hint: Text('Select RT'),
                      onChanged: (RTModel? newValue) {
                        controller.setSelectedRT(newValue);
                      },
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      dropdownColor: primary,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      items: controller.rt.map((rt) {
                        return DropdownMenuItem<RTModel>(
                          value: rt,
                          child: Text(rt.name),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: primary,
                    fixedSize:
                        Size(MediaQueryWidth * 0.35, MediaQueryHeight * 0.025),
                  ),
                  onPressed: () {
                    controller.postData();
                  },
                  child: Text(
                    "Save",
                    style: GoogleFonts.inter(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/models/kategori_sampah.dart';
import '../../../common/button.dart';
import '../../../models/user.dart';
import '../../profil/controllers/profil_controller.dart';
import '../controllers/setor_controller.dart';

class SetorView extends GetView<SetorController> {
  const SetorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _dateController = TextEditingController();

    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    final ProfilController ProfilCtrl = Get.put(ProfilController());

    return Scaffold(
      body: Obx(() {
        return Container(
          padding: EdgeInsets.only(top: 45, left: 30, right: 30),
          width: MediaQueryWidth,
          height: MediaQueryHeight,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/image/icon_setor.png',
                      scale: 1.6,
                    ),
                    SizedBox(
                      width: MediaQueryWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Setor Sampah',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
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
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.05,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('Nama', Colors.black, 15, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    CustomeTextFieldSetorSampah(
                        initialValue: "${ProfilCtrl.name.value}",
                        hint: 'Masukkan Nama Penyetor',
                        obscureText: false,
                        enable: false),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.01,
              ),
              Container(
                width: MediaQueryWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText(
                        'Kategori Sampah', Colors.black, 15, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    DropdownButtonFormField<Kategori>(
                      value: null,
                      hint: Text('Select Kategori'),
                      onChanged: (Kategori? kategori) {
                        controller.onCategorySelected(kategori);
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
                      items: controller.kategori.map((kategori) {
                        return DropdownMenuItem<Kategori>(
                          value: kategori,
                          child: Text(kategori.categoryName),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.01,
              ),
              Container(
                width: MediaQueryWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    reusableText(
                        'Jenis Sampah : ', Colors.black, 15, FontWeight.bold),
                    SizedBox(
                      width: MediaQueryWidth * 0.01,
                    ),
                    reusableText(
                        'Anorganik', Colors.black, 15, FontWeight.bold),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('Tanggal Setor Sampah', Colors.black, 15,
                        FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.013,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 4,
                            offset: Offset.fromDirection(1.6),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate:
                                controller.selectedDate.value ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (newDate != null) {
                            controller.updateSelectedDate(newDate);
                            _dateController.text =
                                "${newDate.day}-${newDate.month}-${newDate.year}";
                          }
                        },
                        child: TextFormField(
                          style: GoogleFonts.inter(),
                          enabled: false,
                          controller: _dateController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              FontAwesomeIcons.calendarPlus,
                              color: primary,
                            ),
                            hintText: "DD/MM/YY",
                            hintStyle: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: hints_text_setor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.01,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('Alamat', Colors.black, 15, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    CustomeTextFieldSetorSampah(
                        initialValue: "${ProfilCtrl.address.value}",
                        hint: 'Masukkan Alamat Penyetor',
                        obscureText: false,
                        enable: false),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
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
                  controller.postDataToApi();
                },
                child: Text(
                  "Setor",
                  style: GoogleFonts.inter(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:get/get.dart';

class DataNasabahItem extends StatelessWidget {
  final Map<String, dynamic> userData;
  const DataNasabahItem({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.grey.shade400,
              backgroundImage: NetworkImage(
                userData['profile_picture'],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData['full_name'],
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    userData['phone'],
                    overflow: TextOverflow.fade,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: nasabahPhoneNumberTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: primary,
                      minimumSize: const Size(32, 32),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () {
                    final selectedId = userData['id'];
                    Get.toNamed('/transaksiadmin', arguments: selectedId);
                  },
                  child: Image.asset(
                    'assets/image/icon_trannsaksi.png',
                    width: 26,
                    height: 26,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: primary,
                      minimumSize: const Size(32, 32),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () {
                    final selectedId = userData['id'];
                    Get.toNamed('/nasabahdetail', arguments: selectedId);
                  },
                  child: Image.asset(
                    'assets/image/icon_mata.png',
                    width: 26,
                    height: 26,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

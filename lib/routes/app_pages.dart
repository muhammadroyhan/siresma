import 'package:get/get.dart';
import 'package:siresma/bindings/admin/barcode_binding.dart';
import 'package:siresma/bindings/admin/detail_nasabah_binding.dart';
import 'package:siresma/bindings/admin/nasabah_binding.dart';
import 'package:siresma/bindings/admin/navbar_admin_binding.dart';
import 'package:siresma/bindings/admin/transaksi_admin_binding.dart';
import 'package:siresma/bindings/admin/transaksi_keluar_binding.dart';
import 'package:siresma/bindings/admin/transaksi_masuk_binding.dart';
import 'package:siresma/bindings/user/editprofile_binding.dart';
import 'package:siresma/bindings/user/evoucher_binding.dart';
import 'package:siresma/bindings/user/home_binding.dart';
import 'package:siresma/bindings/user/location_binding.dart';
import 'package:siresma/bindings/user/login_binding.dart';
import 'package:siresma/bindings/user/otp_binding.dart';
import 'package:siresma/bindings/user/profile_binding.dart';
import 'package:siresma/bindings/user/qrcode_binding.dart';
import 'package:siresma/bindings/user/register_binding.dart';
import 'package:siresma/bindings/user/setorsampah_binding.dart';
import 'package:siresma/bindings/user/splash_binding.dart';
import 'package:siresma/bindings/user/tabungansampah_binding.dart';
import 'package:siresma/bindings/user/tariktunai_binding.dart';
import 'package:siresma/bindings/user/transaksi_binding.dart';
import 'package:siresma/bindings/user/usernavbar_binding.dart';
import 'package:siresma/views/admin/barcode_screen.dart';
import 'package:siresma/views/admin/detail_nasabah_screen.dart';
import 'package:siresma/views/admin/nasabahscreen.dart';
import 'package:siresma/views/admin/navbaradminscreen.dart';
import 'package:siresma/views/admin/transaksi_admin/transaksi_admin_screen.dart';
import 'package:siresma/views/admin/transaksi_keluar_screen.dart';
import 'package:siresma/views/admin/transaksi_masuk_screen.dart';

import 'package:siresma/views/user/editprofilescreen.dart';
import 'package:siresma/views/user/evocuherscreen.dart';
import 'package:siresma/views/user/homescreen.dart';
import 'package:siresma/views/user/locationscreen.dart';
import 'package:siresma/views/user/loginscreen.dart';
import 'package:siresma/views/user/otpscreen.dart';
import 'package:siresma/views/user/profilescreen.dart';
import 'package:siresma/views/user/qrcodescreen.dart';
import 'package:siresma/views/user/registerscreen.dart';
import 'package:siresma/views/user/setorsampahscreen.dart';
import 'package:siresma/views/user/splashscreen.dart';
import 'package:siresma/views/user/tabungansampahscreen.dart';
import 'package:siresma/views/user/tariktunaiscreen.dart';
import 'package:siresma/views/user/transaksi/transaksiscreen.dart';
import 'package:siresma/views/user/usernavbarscreen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EVOUCHER,
      page: () => const EvoucherScreen(),
      binding: EvoucherBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => const LocationScreen(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const Profilescreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.USERNAVBAR,
      page: () => const UserNavbarScreen(),
      binding: UserNavbarBinding(),
    ),
    GetPage(
      name: _Paths.SETORSAMPAH,
      page: () => const SetorSampahScreen(),
      binding: SetorSampahBinding(),
    ),
    GetPage(
      name: _Paths.TABUNGANSAMPAH,
      page: () => const TabunganSampahScreen(),
      binding: TabunganSampahBinding(),
    ),
    GetPage(
      name: _Paths.QRCODE,
      page: () => const Qrcodescreen(),
      binding: QrcodeBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => const Transaksiscreen(),
      binding: TransaksiBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => const Editprofilescreen(),
      binding: EditprofileBinding(),
    ),
    GetPage(
      name: _Paths.ADMINNAVBAR,
      page: () => const Navbaradminscreen(),
      binding: NavbarAdminBinding(),
    ),
    GetPage(
      name: _Paths.NASABAH,
      page: () => const Nasabahscreen(),
      binding: NasabahBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSIMASUK,
      page: () => const TransaksiMasukScreen(),
      binding: TransaksiMasukBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSIKELUAR,
      page: () => const TransaksiKeluarScreen(),
      binding: TransaksiKeluarBinding(),
    ),
    GetPage(
      name: _Paths.BARCODE,
      page: () => const BarcodeScreen(),
      binding: BarcodeBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSIADMIN,
      page: () => const TransaksiAdminScreen(),
      binding: TransaksiAdminBinding(),
    ),
    GetPage(
      name: _Paths.DETAILNASABAH,
      page: () => const DetailNasabahScreen(),
      binding: DetailNasabahBinding(),
    ),
    GetPage(
      name: _Paths.TARIKTUNAI,
      page: () => const Tariktunaiscreen(),
      binding: TariktunaiBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:siresma/app/modules/qradmin/bindings/qradmin_binding.dart';
import 'package:siresma/app/modules/qradmin/views/qradmin_view.dart';
import 'package:siresma/app/modules/transaksi/views/transaksi_view.dart';
import 'package:siresma/app/modules/transaksiadmin/views/transaksiadmin_view.dart';

import '../modules/datanasabah/bindings/datanasabah_binding.dart';
import '../modules/datanasabah/views/datanasabah_view.dart';
import '../modules/edit_profil/bindings/edit_profil_binding.dart';
import '../modules/edit_profil/views/edit_profil_view.dart';
import '../modules/evoucher/bindings/evoucher_binding.dart';
import '../modules/evoucher/views/evoucher_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/inputcode/bindings/inputcode_binding.dart';
import '../modules/inputcode/views/inputcode_view.dart';
import '../modules/keamanan/bindings/keamanan_binding.dart';
import '../modules/keamanan/views/keamanan_view.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/views/location_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/nasabahdetail/bindings/nasabahdetail_binding.dart';
import '../modules/nasabahdetail/views/nasabahdetail_view.dart';
import '../modules/navbar/bindings/navbar_binding.dart';
import '../modules/navbar/views/navbar_view.dart';
import '../modules/navbaradmin/bindings/navbaradmin_binding.dart';
import '../modules/navbaradmin/views/navbaradmin_view.dart';

import '../modules/navbarprofile/bindings/navbarprofile_binding.dart';
import '../modules/navbarprofile/views/navbarprofile_view.dart';
import '../modules/navbartabungan/bindings/navbartabungan_binding.dart';
import '../modules/navbartabungan/views/navbartabungan_view.dart';
import '../modules/number/bindings/number_binding.dart';
import '../modules/number/views/number_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/privasi/bindings/privasi_binding.dart';
import '../modules/privasi/views/privasi_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/qrcode/bindings/qrcode_binding.dart';
import '../modules/qrcode/views/qrcode_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/qrakun/bindings/qrakun_binding.dart';
import '../modules/qrakun/views/qrakun_view.dart';
import '../modules/setor/bindings/setor_binding.dart';
import '../modules/setor/views/setor_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

import '../modules/tabunganbefore/bindings/tabunganbefore_binding.dart';
import '../modules/tabunganbefore/views/tabunganbefore_view.dart';
import '../modules/tarik_saldo/bindings/tarik_saldo_binding.dart';
import '../modules/tarik_saldo/views/tarik_saldo_view.dart';
import '../modules/transaksi/bindings/transaksi_binding.dart';
import '../modules/transaksiadmin/bindings/transaksiadmin_binding.dart';
import '../modules/transaksikeluar/bindings/transaksikeluar_binding.dart';
import '../modules/transaksikeluar/views/transaksikeluar_view.dart';
import '../modules/transaksimasuk/bindings/transaksimasuk_binding.dart';
import '../modules/transaksimasuk/views/transaksimasuk_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.SETOR,
      page: () => const SetorView(),
      binding: SetorBinding(),
    ),
    GetPage(
      name: _Paths.QRAKUN,
      page: () => QrAkunView(),
      binding: QrAkunBinding(),
    ),
    GetPage(
      name: _Paths.NUMBER,
      page: () => NumberView(),
      binding: NumberBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => const LocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.EVOUCHER,
      page: () => const EvoucherView(),
      binding: EvoucherBinding(),
    ),
    GetPage(
      name: _Paths.NAVBARPROFIL,
      page: () => const NavbarProfilView(),
      binding: NavbarProfilBinding(),
    ),
    GetPage(
      name: _Paths.QRCODE,
      page: () => const QrcodeView(),
      binding: QrcodeBinding(),
    ),
    GetPage(
      name: _Paths.KEAMANAN,
      page: () => const KeamananView(),
      binding: KeamananBinding(),
    ),
    GetPage(
        name: _Paths.NAVBARTABUNGAN,
        page: () => const NavbarTabunganView(),
        binding: NavbarTabunganBinding()),
    GetPage(
      name: _Paths.PRIVASI,
      page: () => const PrivasiView(),
      binding: PrivasiBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => const TransaksiView(),
      binding: TransaksiBinding(),
    ),
    GetPage(
      name: _Paths.TABUNGANBEFORE,
      page: () => const TabunganbeforeView(),
      binding: TabunganbeforeBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSIADMIN,
      page: () => const TransaksiAdminView(),
      binding: TransaksiadminBinding(),
    ),
    GetPage(
      name: _Paths.NASABAHDETAIL,
      page: () => const NasabahDetailView(),
      binding: NasabahDetailBinding(),
    ),
    GetPage(
      name: _Paths.DATANASABAH,
      page: () => const DataNasabahView(),
      binding: DataNasabahBinding(),
    ),
    GetPage(
      name: _Paths.NAVBARADMIN,
      page: () => const NavbarAdminView(),
      binding: NavbarAdminBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSIMASUK,
      page: () => const TransaksiMasukView(),
      binding: TransaksiMasukBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSIKELUAR,
      page: () => const TransaksiKeluarView(),
      binding: TransaksiKeluarBinding(),
    ),
    GetPage(
      name: _Paths.TARIKSALDO,
      page: () => const TarikSaldoView(),
      binding: TarikSaldoBinding(),
    ),
    GetPage(
      name: _Paths.QRADMIN,
      page: () => const QrAdminView(),
      binding: QrAdminBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFIL,
      page: () => const EditProfilView(),
      binding: EditProfilBinding(),
    ),
    GetPage(
      name: _Paths.INPUTCODE,
      page: () => InputCodeView(),
      binding: InputCodeBinding(),
    )
  ];
}

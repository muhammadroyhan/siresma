class API {
  static const login = 'http://api.siresma.my.id/api/auth/login';
  static const otp = 'http://api.siresma.my.id/api/auth/verify';
  static const create_otp = 'http://api.siresma.my.id/api/auth/otp/create';
  static const register = 'http://api.siresma.my.id/api/auth/registration';
  static const logout = 'http://api.siresma.my.id/api/auth/logout';
  static const bank_sampah = 'http://api.siresma.my.id/api/bank-sampah/list';
  static const home = 'http://api.siresma.my.id/api/home';
  static const choose_bank_sampah =
      'http://api.siresma.my.id/api/bank-sampah/choose';
  static const ganti_password =
      'http://api.siresma.my.id/api/myprofile/update/password';
  static const update_profil = 'http://api.siresma.my.id/api/myprofile/update';
  static const category_sampah = 'http://api.siresma.my.id/api/trash/category';
  static const setor_sampah = 'http://api.siresma.my.id/api/trash/store';
  static const iot = 'http://api.siresma.my.id/api/trash/iot-connect';
  static const list_sampah = 'http://api.siresma.my.id/api/trash/list';
  static const get_profile = 'http://api.siresma.my.id/api/myprofile/details';
  static const weight_iots = 'http://api.siresma.my.id/api/iot/store';
  static const data_nasabah = 'http://api.siresma.my.id/api/admin/nasabah';
  static const transaksi = 'http://api.siresma.my.id/api/transaction/withdraw';
  static const list_transaksi = 'http://api.siresma.my.id/api/transaction/list';
  static const detail_nasabah =
      'http://api.siresma.my.id/api/admin/nasabah/details';
  static const transaksi_admin =
      'http://api.siresma.my.id/api/admin/nasabah/details/transactions';
  static const transaksimasuk =
      'http://api.siresma.my.id/api/admin/transactions/incoming';
  static const transaksikeluar =
      'http://api.siresma.my.id/api/admin/transactions/outcoming';
  static const approvetransaksi =
      'http://api.siresma.my.id/api/admin/nasabah/details/transactions/approve';
  static const code_iots = "http://api.siresma.my.id/api/iot/connect";
}

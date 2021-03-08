class ProfilKarti{
  String _ad;
  String _image;
  String _kullanci_adi;
  String _kapak_resmi;


  String get kapak_resmi => _kapak_resmi;

  set kapak_resmi(String value) {
    _kapak_resmi = value;
  }

  String get kullanci_adi => _kullanci_adi;

  set kullanci_adi(String value) {
    _kullanci_adi = value;
  }

  ProfilKarti(this._ad, this._image,this._kullanci_adi,this._kapak_resmi);

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get ad => _ad;

  set ad(String value) {
    _ad = value;
  }
}
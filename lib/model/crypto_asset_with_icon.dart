class CryptoAssetWithIcon {
  String assetId;
  String url;

  CryptoAssetWithIcon(this.assetId, this.url);

  CryptoAssetWithIcon.fromJson(Map<String, dynamic> json)
      : assetId = json['asset_id'],
        url = json['url'].toString();
}

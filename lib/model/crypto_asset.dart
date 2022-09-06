class CryptoAsset {
  String assetId;
  String name;
  double? priceUsd;
  String rate;
  String balance;
  String balanceUsd;

  CryptoAsset(this.assetId, this.name, this.priceUsd, this.rate, this.balance,
      this.balanceUsd);

  CryptoAsset.fromJson(Map<String, dynamic> json)
      : assetId = json['asset_id'],
        name = json['name'],
        priceUsd = double.parse(
            json['price_usd'] == null ? '0' : json['price_usd'].toString()),
        rate = '+8.64%',
        balance = '1.00531 ' + json['asset_id'],
        balanceUsd = '17693.456 USD';
}

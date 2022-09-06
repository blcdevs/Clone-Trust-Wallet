import 'package:clone_trust/model/crypto_asset.dart';

import '../model/crypto_asset_with_icon.dart';
import '../service/network_service.dart';

abstract class IRepository {
  Future<List<CryptoAssetWithIcon>> getCryptoAssetsWithIcon();
  Future<List<CryptoAsset>> getCryptoAssets();
}

class Repository implements IRepository {
  final INetworkService _networkService;

  Repository(this._networkService);

  @override
  Future<List<CryptoAssetWithIcon>> getCryptoAssetsWithIcon() async {
    final result = await _networkService.getCryptoAssetsWithIcon();
    return result
        .map((dynamic e) =>
            CryptoAssetWithIcon.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<CryptoAsset>> getCryptoAssets() async {
    final result = await _networkService.getCryptoAssets();
    return result
        .map((dynamic e) => CryptoAsset.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

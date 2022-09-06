import 'package:dio/dio.dart';
import 'package:clone_trust/utils/constants.dart';

abstract class INetworkService {
  Future<List<dynamic>> getCryptoAssetsWithIcon();
  Future<List<dynamic>> getCryptoAssets();
}

class NetworkService implements INetworkService {
  var _dioClient;
  NetworkService(this._dioClient);

  @override
  Future<List<dynamic>> getCryptoAssetsWithIcon() async {
    try {
      final result = await _dioClient.get<List<dynamic>>(
        assetWithIconBaseUrl,
        options: Options(
          headers: <String, String>{'X-CoinAPI-Key': '{$apiKey}'},
        ),
      );

      return result.data!;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<dynamic>> getCryptoAssets() async {
    try {
      final result = await _dioClient.get<List<dynamic>>(
        assetBaseUrl,
        options: Options(
          headers: <String, String>{'X-CoinAPI-Key': '{$apiKey}'},
        ),
      );

      return result.data!;
    } catch (e) {
      return [];
    }
  }
}

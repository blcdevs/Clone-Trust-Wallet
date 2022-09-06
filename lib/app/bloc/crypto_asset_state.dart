part of 'crypto_asset_cubit.dart';

@immutable
abstract class CryptoAssetState {}

class CryptoInitial extends CryptoAssetState {}

class CryptoLoaded extends CryptoAssetState {
  final List<CryptoAssetWithIcon> cryptoAssetWithIcon;
  final List<CryptoAsset> cryptoAssets;

  CryptoLoaded({
    required this.cryptoAssetWithIcon,
    required this.cryptoAssets,
  });
}

import 'package:bloc/bloc.dart';
import 'package:clone_trust/model/crypto_asset.dart';
import 'package:clone_trust/model/crypto_asset_with_icon.dart';
import 'package:meta/meta.dart';
import '../../repository/repository.dart';

part 'crypto_asset_state.dart';

class CryptoAssetCubit extends Cubit<CryptoAssetState> {
  final IRepository _repository;

  CryptoAssetCubit(this._repository) : super(CryptoInitial());

  void getCryptoAssets() {
    _repository.getCryptoAssetsWithIcon().then((cryptoAssetWithIcon) {
      _repository.getCryptoAssets().then((cryptoAssets) {
        emit(CryptoLoaded(
            cryptoAssetWithIcon: cryptoAssetWithIcon,
            cryptoAssets: cryptoAssets));
      });
    });
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clone_trust/app/bloc/crypto_asset_cubit.dart';
import 'package:clone_trust/app/ui/widgets/cached_circle_avatar.dart';

class CryptoDetail extends StatelessWidget {
  const CryptoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CryptoAssetCubit>(context).getCryptoAssets();
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: BlocBuilder<CryptoAssetCubit, CryptoAssetState>(
                builder: (context, state) {
              if (state is! CryptoLoaded) {
                return const Center(child: CircularProgressIndicator());
              }
              final cryptoAssetWithIcon = state.cryptoAssetWithIcon;
              final cryptoAssets = state.cryptoAssets;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: cryptoAssets.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      isThreeLine: true,
                      leading: CachedCircleAvatar(
                          url: cryptoAssetWithIcon[index].url),
                      title: Text(
                        cryptoAssets[index].name,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(cryptoAssets[index].priceUsd! > 0
                                ? cryptoAssets[index]
                                        .priceUsd!
                                        .toStringAsFixed(2) +
                                    ' USD'
                                : ''),
                            const SizedBox(width: 15.0),
                            Text(
                              cryptoAssets[index].priceUsd! > 0
                                  ? cryptoAssets[index].rate
                                  : '',
                              style: const TextStyle(color: Colors.lightGreen),
                            )
                          ]),
                      trailing: Container(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(cryptoAssets[index].balance,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.5)),
                              const SizedBox(height: 4.0),
                              Text(cryptoAssets[index].balanceUsd,
                                  style: const TextStyle(
                                      fontSize: 13.7, color: Colors.black54))
                            ],
                          )),
                    );
                  });
            })));
  }
}

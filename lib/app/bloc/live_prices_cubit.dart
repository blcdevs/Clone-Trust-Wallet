import 'package:bloc/bloc.dart';
import 'package:clone_trust/utils/constants.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:core';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'live_prices_state.dart';

class LivePricesCubit extends Cubit<LivePricesState> {
  final WebSocketChannel _channel =
      WebSocketChannel.connect(Uri.parse(webSocketUrl));

  LivePricesCubit() : super(LivePricesInitial());

  @override
  Future<void> close() {
    _channel.sink.close();
    return super.close();
  }

  Stream getRealTrade() {
    _channel.sink.add(json.encode({
      "type": "hello",
      "apikey": apiKey,
      "heartbeat": false,
      "subscribe_data_type": ["trade"],
      "subscribe_filter_symbol_id": [
        r"COINBASE_SPOT_BTC_USD$",
        r"COINBASE_SPOT_ETH_USD$",
        r"COINBASE_SPOT_ADA_USD$"
      ]
    }));

    return _channel.stream;
  }
}

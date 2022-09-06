import 'dart:core';

import 'package:flutter/material.dart';

class Coin {
  late final Icon icon;
  late final String name;
  late final String usdPrice;
  late final String rate;
  late final String total;
  late final String usdTotal;

  Coin({
    required this.icon,
    required this.name,
    required this.usdPrice,
    required this.rate,
    required this.total,
    required this.usdTotal,
  });
}

List<Coin> coinList = [
  Coin(
    icon: const Icon(Icons.circle),
    name: 'Bitcoin',
    usdPrice: '17.600',
    rate: '+8.64%',
    total: '1.00531',
    usdTotal: '17693.456',
  ),
  Coin(
    icon: const Icon(Icons.circle),
    name: 'Ethereum',
    usdPrice: '129',
    rate: '+4.93%',
    total: '1.0934',
    usdTotal: '141.04',
  ),
  Coin(
    icon: const Icon(Icons.circle),
    name: 'Binance Coin',
    usdPrice: '20',
    rate: '+7.33%',
    total: '37',
    usdTotal: '740',
  ),
  Coin(
    icon: const Icon(Icons.circle),
    name: 'Litecoin',
    usdPrice: '31.33',
    rate: '+1.73%',
    total: '11.243',
    usdTotal: '352.24',
  ),
  Coin(
    icon: const Icon(Icons.circle),
    name: 'XRP',
    usdPrice: '0.31',
    rate: '+3.02%',
    total: '20',
    usdTotal: '6.2',
  ),
  Coin(
    icon: const Icon(Icons.circle),
    name: 'Bitcoin Cash',
    usdPrice: '324',
    rate: '-2.09%',
    total: '16.58',
    usdTotal: '5371.92',
  )
];

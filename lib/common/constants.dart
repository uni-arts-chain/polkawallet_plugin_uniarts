import 'package:flutter/material.dart';

const int SECONDS_OF_DAY = 24 * 60 * 60; // seconds of one day
const int SECONDS_OF_YEAR = 365 * 24 * 60 * 60; // seconds of one year

const node_list_uniarts = [
  {
    'name': 'UniArts (UniArts Mainnet, hosted by UniArts)',
    'ss58': 42,
    'endpoint': 'wss://mainnet.uniarts.vip:9443',
  },
];
const node_list_polkadot = [
  {
    'name': 'Polkadot (Live, hosted by PatractLabs)',
    'ss58': 0,
    'endpoint': 'wss://polkadot.elara.patract.io',
  },
  {
    'name': 'Polkadot (Live, hosted by Parity)',
    'ss58': 0,
    'endpoint': 'wss://rpc.polkadot.io',
  },
  {
    'name': 'Polkadot (Live, hosted by onfinality)',
    'ss58': 0,
    'endpoint': 'wss://polkadot.api.onfinality.io/public-ws',
  },
];

// const home_nav_items = ['staking', 'governance'];
const home_nav_items = [];

const MaterialColor uniarts_blue = const MaterialColor(
  0xFF0000AA,
  const <int, Color>{
    50: const Color(0xFF0000AA),
    100: const Color(0xFF0000BB),
    200: const Color(0xFF0000BB),
    300: const Color(0xFF0000CC),
    400: const Color(0xFF0000CC),
    500: const Color(0xFF0000DD),
    600: const Color(0xFF0000DD),
    700: const Color(0xFF0000EE),
    800: const Color(0xFF0000FF),
    900: const Color(0xFF0000FF),
  },
);

const String genesis_hash_uniarts =
    '0xbc20e8f3a4a9340f31bcf5be6288a98e064d84f67a94e41ed9e65d10e15e0077';
const String genesis_hash_polkadot =
    '0x91b171bb158e2d3848fa23a9f1c25182fb8e20313b2c1eb49219da7a70ce90c3';
const String network_name_uniarts = 'uniarts';
const String network_name_polkadot = 'polkadot';

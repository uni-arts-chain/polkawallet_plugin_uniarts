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

const home_nav_items = [];

const MaterialColor uniarts_blue = const MaterialColor(
  0xFF55ADFF,
  const <int, Color>{
    50: const Color(0x6655ADFF),
    100: const Color(0x7755ADFF),
    200: const Color(0x8855ADFF),
    300: const Color(0x9955ADFF),
    400: const Color(0xAA55ADFF),
    500: const Color(0xBB55ADFF),
    600: const Color(0xCC55ADFF),
    700: const Color(0xDD55ADFF),
    800: const Color(0xEE55ADFF),
    900: const Color(0xFF55ADFF),
  },
);

const String genesis_hash_uniarts =
    '0xbc20e8f3a4a9340f31bcf5be6288a98e064d84f67a94e41ed9e65d10e15e0077';
const String network_name_uniarts = 'uniarts';

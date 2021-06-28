library polkawallet_plugin_uniarts;

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polkawallet_plugin_uniarts/common/constants.dart';
import 'package:polkawallet_plugin_uniarts/service/index.dart';
import 'package:polkawallet_plugin_uniarts/store/cache/storeCache.dart';
import 'package:polkawallet_plugin_uniarts/store/index.dart';
import 'package:polkawallet_plugin_uniarts/utils/i18n/index.dart';
import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:polkawallet_sdk/plugin/homeNavItem.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:polkawallet_sdk/utils/i18n.dart';
import 'package:polkawallet_ui/pages/dAppWrapperPage.dart';
import 'package:polkawallet_ui/pages/txConfirmPage.dart';
import 'package:polkawallet_ui/pages/walletExtensionSignPage.dart';

class PluginUniarts extends PolkawalletPlugin {
  /// the uniatrrs plugin support two networks: Uniarts & polkadot,
  /// so we need to identify the active network to connect & display UI.
  PluginUniarts({name = 'uniarts'})
      : basic = PluginBasicData(
          name: name,
          genesisHash: genesis_hash_uniarts,
          ss58: 42,
          primaryColor: uniarts_blue,
          gradientColor: Color(0xFF55ADFF),
          backgroundImage: AssetImage(
              'packages/polkawallet_plugin_uniarts/assets/images/public/bg_uniarts.png'),
          icon: Image.asset(
              'packages/polkawallet_plugin_uniarts/assets/images/public/uniarts.png'),
          iconDisabled: Image.asset(
              'packages/polkawallet_plugin_uniarts/assets/images/public/uniarts_gray.png'),
          jsCodeVersion: 20101,
          isTestNet: false,
        ),
        recoveryEnabled = true,
        _cache = StoreCacheUniarts();

  @override
  final PluginBasicData basic;

  @override
  final bool recoveryEnabled;

  @override
  List<NetworkParams> get nodeList {
    return node_list_uniarts.map((e) => NetworkParams.fromJson(e)).toList();
  }

  @override
  final Map<String, Widget> tokenIcons = {
    'UART': Image.asset(
        'packages/polkawallet_plugin_uniarts/assets/images/tokens/UART.png')
  };

  @override
  List<HomeNavItem> getNavItems(BuildContext context, Keyring keyring) {
    return home_nav_items.map((e) {
      final dic = I18n.of(context).getDic(i18n_full_dic_uniarts, 'common');
      return HomeNavItem(
        text: dic[e],
        icon: SvgPicture.asset(
          'packages/polkawallet_plugin_uniarts/assets/images/public/nav_$e.svg',
          color: Theme.of(context).disabledColor,
        ),
        iconActive: SvgPicture.asset(
          'packages/polkawallet_plugin_uniarts/assets/images/public/nav_$e.svg',
          color: basic.primaryColor,
        ),
        content: null,
      );
    }).toList();
  }

  @override
  Map<String, WidgetBuilder> getRoutes(Keyring keyring) {
    return {
      TxConfirmPage.route: (_) =>
          TxConfirmPage(this, keyring, _service.getPassword)
    };
  }

  @override
  Future<String> loadJSCode() => null;

  PluginStore _store;
  PluginApi _service;
  PluginStore get store => _store;
  PluginApi get service => _service;

  final StoreCache _cache;

  @override
  Future<void> onWillStart(Keyring keyring) async {
    await GetStorage.init(plugin_uniarts_storage_key);
    _store = PluginStore(_cache);
    _service = PluginApi(this, keyring);
  }

  @override
  Future<void> onStarted(Keyring keyring) async {}

  @override
  Future<void> onAccountChanged(KeyPairData acc) async {}
}

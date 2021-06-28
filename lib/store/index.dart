import 'package:polkawallet_plugin_uniarts/store/accounts.dart';
import 'package:polkawallet_plugin_uniarts/store/cache/storeCache.dart';

class PluginStore {
  PluginStore(StoreCache cache);
  final AccountsStore accounts = AccountsStore();
}

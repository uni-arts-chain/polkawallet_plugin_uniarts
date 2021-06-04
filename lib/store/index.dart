import 'package:polkawallet_plugin_uniarts/store/accounts.dart';
import 'package:polkawallet_plugin_uniarts/store/cache/storeCache.dart';
import 'package:polkawallet_plugin_uniarts/store/gov/governance.dart';
import 'package:polkawallet_plugin_uniarts/store/staking/staking.dart';

class PluginStore {
  PluginStore(StoreCache cache)
      : staking = StakingStore(cache),
        gov = GovernanceStore(cache);
  final StakingStore staking;
  final GovernanceStore gov;
  final AccountsStore accounts = AccountsStore();
}

import 'package:get_storage/get_storage.dart';

const String plugin_uniarts_storage_key = 'plugin_uniarts';

abstract class StoreCache {
  static final _storage = () => GetStorage(plugin_uniarts_storage_key);
}

class StoreCacheUniarts extends StoreCache {
  static final _storage = () => GetStorage(plugin_uniarts_storage_key);
}

import { ApiPromise } from "@polkadot/api";

/**
 * subscribe messages of network state.
 *
 * @param {Function} method i.e. api.derive.chain.bestNumber
 * @param {List<String>} params
 * @param {String} msgChannel
 * @param {Function} transfrom result data transfrom
 */
export async function subscribeMessage(method: any, params: any[], msgChannel: string, transfrom: Function) {
  return method(...params, (res: any) => {
    const data = transfrom ? transfrom(res) : res;
    (<any>window).send(msgChannel, data);
  }).then((unsub: () => void) => {
    const unsubFuncName = `unsub${msgChannel}`;
    (<any>window)[unsubFuncName] = unsub;
    return {};
  });
}

/**
 * get consts of network.
 */
export async function getNetworkConst(api: ApiPromise) {
  return api.consts;
}

/**
 * get network properties, and replace polkadot decimals with const 10.
 */
export async function getNetworkProperties(api: ApiPromise) {
  return {
    ss58Format: 42,
    tokenDecimals: [18],
    tokenSymbol: ["LAMI"],
    genesisHash: api.genesisHash,
  };
}
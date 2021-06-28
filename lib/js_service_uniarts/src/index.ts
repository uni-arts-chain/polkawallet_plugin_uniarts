import "@babel/polyfill";
import { WsProvider, LaminarApi } from "@laminar/api";
import { ApiPromise } from "@polkadot/api";
import { subscribeMessage, getNetworkConst, getNetworkProperties } from "./service/setting";
import { genLinks } from "./utils/config/config";
import keyring from "./service/keyring";
import account from "./service/account";
import laminar from "./service/laminar";
import types from "./types/types.js";

// send message to JSChannel: PolkaWallet
function send(path: string, data: any) {
  console.log(JSON.stringify({ path, data }));
}
send("log", "laminar main js loaded");
(<any>window).send = send;

async function connect(nodes: string[]) {
  return new Promise(async (resolve, reject) => {
    const provider = new WsProvider(nodes);
    try {
      const laminarApi = new LaminarApi({ provider });
      const res = new ApiPromise({
        typesSpec: {
          // uart,
        },
        types: {
            ...types,
        },
        typesChain: {
            // uart,
        },
        typesBundle: {
            // uart,
        },
        provider,
      });
      await laminarApi.isReady();
      await res.isReady;
      (<any>window).laminarApi = laminarApi;
      (<any>window).api = res;
      const url = nodes[(<any>res)._options.provider.__private_15_endpointIndex];
      send("log", `${url} wss connected success`);
      resolve(url);
    } catch (err) {
      send("log", `connect failed`);
      provider.disconnect();
      resolve(null);
    }
  });
}

(<any>window).settings = {
  connect,
  getNetworkConst,
  getNetworkProperties,
  subscribeMessage,
  genLinks,
};

(<any>window).keyring = keyring;
(<any>window).account = account;
(<any>window).laminar = laminar;

Aira node graph PoC
-------------------

AIRA scenario

1. collect IPFS peers in self IPNS storage as JSON object
2. publish IPNS into IPFS PubSub channel

Client scenario

1. collect IPNS ids from PubSub channel (default: graph.1.robonomics.eth)
2. periodically get graph data from IPNS
3. visualize AIRA graph

Graph message format 
====================

**Signature**

Signatures is used to keep ethereum key of network agent. Link between IPFS id and Etehreum address helps us to recover transaction graph and visualize relations between IPFS and Ethereum network layers.

```
JSON encoded message body
---
Ethereum signature
```

**Fields**

* `id` - IPFS node identifier
* `addresses` - list of node connection details in multiaddr format 
* `lighthouse` - current node lighthouse in ENS format
* `peers` - near node peers (connected to the same lighthouse information channel)
* `timestamp` - message formation timestamp

**Sample**

```
{"id": "QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn", "addresses": ["/ip4/127.0.0.1/tcp/4001/ipfs/QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn", "/ip4/192.168.88.25/tcp/4001/ipfs/QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn", "/ip4/192.168.56.1/tcp/4001/ipfs/QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn", "/ip4/172.17.0.1/tcp/4001/ipfs/QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn", "/ip6/::1/tcp/4001/ipfs/QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn", "/ip6/fcd1:5580:c813:6277:4af2:23f1:5229:e20f/tcp/4001/ipfs/QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn", "/ip4/178.163.67.5/tcp/9001/ipfs/QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn", "/ip6/fcd1:5580:c813:6277:4af2:23f1:5229:e20f/tcp/4001/ipfs/QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn", "/ip4/192.168.88.25/tcp/4001/ipfs/QmbtPSNsRQeecUavxVZTULaPhp7owBgfNdbNY5egVPn9jn"], "lighthouse": "airalab.lighthouse.1.robonomics.eth", "peers": [], "timestamp": 1536745857}
---
0x31cc1267996e654918457dff5ea62eea706837322ffcabdd2b361ddf66781e377f06c983e4e255f839b96bac505e584d985e0ea226848b38002c429cfad77fb91c
```

Build & run
===========

```bash
$ nix-shell -I nixpkgs=/path/to/airapkgs
$ aira-graph airalab.lighthouse.1.robonomics.eth -k /path/to/ethereum/key -w /path/to/ethereum/password
```

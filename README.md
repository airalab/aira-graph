Aira node graph PoC
-------------------

AIRA scenario

1. collect IPFS peers in self IPNS storage as JSON object
2. publish IPNS into IPFS PubSub channel

Client scenario

1. collect IPNS ids from PubSub channel
2. periodically get graph data from IPNS
3. visualize AIRA graph

Build & run
===========

```bash
$ nix-shell -I nixpkgs=/path/to/airapkgs
$ aira-graph airalab.lighthouse.1.robonomics.eth
```

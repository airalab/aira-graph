{ pkgs ? import <nixpkgs> {} }:

with pkgs.python3Packages;

buildPythonApplication {
  pname = "aira-graph";
  version = "0.1";
  src = ./.;
  propagatedBuildInputs = [ ipfsapi web3 ];
}

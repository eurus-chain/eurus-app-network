# apiHandler
A dart library that connects to interact with the Ethereum blockchain. It connects
to an Ethereum node to send transactions, interact with smart contracts and much
more!

### Features
- Connect to an Ethereum node with the rpc-api, call common methods
- Send signed Ethereum transactions
- Generate private keys, setup new Ethereum addresses
- Call functions on smart contracts and listen for contract events
### TODO
- Code generation based on smart contract ABI for easier interaction
- Encode all supported solidity types, although only (u)fixed,
  which are not commonly used, are not supported at the moment.

## Usage

### Credentials and Wallets
In order to send transactions on the Ethereum network, some credentials
are required. The library supports raw private keys and v3 wallet files.

### Only support ropsten testnet now

```dart
import 'package:apihandler/web3dart.dart';
// You can setup private keys first
web3dart.setUpPrivateKey(privateKey:'d1bdc683fbeb9fa0b4ceb26adb39eaffb21b16891ea28e4cf1bc3118fdd39295');

```

## Sending transactions
Of course, this library supports creating, signing and sending Ethereum
transactions:

```dart
import 'package:web3dart/web3dart.dart';
/// send ETH Token Transaction
web3dart.sendETHTransaction(amount: EtherAmount.fromUnitAndValue(EtherUnit.finney, 1),toAddress:'0xA3B4dE5E90A18512BD82c1A640AC99b39ef2258A');

/// send ERC20 Token Transaction
web3dart.sendERC20Transaction(contractAddress: '0x7e0480ca9fd50eb7a3855cf53c347a1b4d6a2ff5',amount: BigInt.from(1000000000000000000),toAddress:'0xA3B4dE5E90A18512BD82c1A640AC99b39ef2258A');

```

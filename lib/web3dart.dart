import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' show join, dirname;
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart' show rootBundle;

class Web3dart {
  static const String rpcUrl = 'http://18.141.43.75:20000';

  static EthereumAddress contractAddress =
      EthereumAddress.fromHex('0xfeae27388A65eE984F452f86efFEd42AaBD438FD');

  void getOwnerAddress() async {
    final client = Web3Client(rpcUrl, Client());
    String contractAbi = '''[
      {
        "inputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "constructor"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "oldOwner",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "address",
            "name": "newOwner",
            "type": "address"
          }
        ],
        "name": "OwnerSet",
        "type": "event"
      },
      {
        "constant": false,
        "inputs": [
          {
            "internalType": "address",
            "name": "newOwner",
            "type": "address"
          }
        ],
        "name": "changeOwner",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "constant": true,
        "inputs": [],
        "name": "getOwner",
        "outputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
      }
    ]''';

    final contract = DeployedContract(
        ContractAbi.fromJson(contractAbi, 'contract'), contractAddress);

    final setOwnerFunction = contract.function('getOwner');

    client
        .call(
          contract: contract,
          function: setOwnerFunction,
          params: [],
        )
        .then((value) => print("result: $value"))
        .catchError((e) => print("failed $e"));
  }

  void init() async {
    var rng = new Random.secure();
    Credentials random = EthPrivateKey.createRandom(rng);

    var address = await random.extractAddress();
    print("extract address: ${address.hex}");

    Wallet wallet = Wallet.createNew(random, 'password', Random(), scryptN: pow(2, 8));
    print("wallet json ${wallet.toJson()}");
  }
}

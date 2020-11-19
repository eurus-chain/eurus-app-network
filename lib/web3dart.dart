import 'dart:math';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart' show rootBundle;

class Web3dart {

  static final Web3dart _instance = Web3dart._internal();
  Client httpClient = new Client();
  Web3Client ethClient;
  Credentials credentials;

  Web3dart._internal() {
    initEthClient();
  }

  factory Web3dart() {
    return _instance;
  }

  initEthClient() async {
    ethClient = new Web3Client('https://ropsten.infura.io/v3/fa89761e51884ca48dce5c0b6cfef565', httpClient);
    credentials = await ethClient.credentialsFromPrivateKey("d1bdc683fbeb9fa0b4ceb26adb39eaffb21b16891ea28e4cf1bc3118fdd39295");
  }

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
        .then((value) => print("company eth node getOwner: $value"))
        .catchError((e) => print("catchError $e"));
  }

  void sendETHTransaction() async {
      String resultString = await ethClient.sendTransaction(
          credentials,
          Transaction(
            to: EthereumAddress.fromHex(
                '0xA3B4dE5E90A18512BD82c1A640AC99b39ef2258A'),
            gasPrice: EtherAmount.inWei(BigInt.one),
            maxGas: 100000,
            value: EtherAmount.fromUnitAndValue(EtherUnit.finney, 1),
          ),
          fetchChainIdFromNetworkId: true
      );

      print("sendTransaction resultString:$resultString");
  }

  void getETHClientDetail() async {
    print("---------------------- getETHClientDetail ----------------------");
    print("getClientVersion:${await ethClient.getClientVersion()}");
    print("getBlockNumber:${await ethClient.getBlockNumber()}");
    print("getGasPrice:${await ethClient.getGasPrice()}");
    print("getEtherProtocolVersion:${await ethClient.getEtherProtocolVersion()}");
    print("getMiningHashrate:${await ethClient.getMiningHashrate()}");
    print("getNetworkId:${await ethClient.getNetworkId()}");
    print("getPeerCount:${await ethClient.getPeerCount()}");
  }

  void getAddressDetail() async {
    print("---------------------- getAddressDetail ----------------------");
    print("getBalance:${await ethClient.getBalance(EthereumAddress.fromHex(
        '0x44f426bc9ac7a83521EA140Aeb70523C0a85945a'),)}");
    print("etTransactionCount:${await ethClient.getTransactionCount(EthereumAddress.fromHex(
        '0x44f426bc9ac7a83521EA140Aeb70523C0a85945a'),)}");
    TransactionReceipt transactionReceipt = await ethClient.getTransactionReceipt("0xfa0a7ed6a87b655f2302ce2d88d1d051c4eeef2af6e82de9850f3527a8106744");
    print("---------------------- hash data ----------------------");
    print("transactionReceipt.contractAddress:${transactionReceipt.contractAddress}");
    print("transactionReceipt.gasUsed:${transactionReceipt.gasUsed}");
    print("transactionReceipt.from:${transactionReceipt.from}");
    print("transactionReceipt.to:${transactionReceipt.to}");
  }

  void initNewWallet() async {
    var rng = new Random.secure();
    Credentials random = EthPrivateKey.createRandom(rng);

    var address = await random.extractAddress();
    print("extract address: ${address.hex}");

    Wallet wallet = Wallet.createNew(random, 'password', Random(), scryptN: pow(2, 8));
    print("wallet json ${wallet.toJson()}");
  }
}

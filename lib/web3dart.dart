import 'dart:math';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
export 'package:web3dart/web3dart.dart';

class Web3dart {
  static final Web3dart _instance = Web3dart._internal();
  Client httpClient = new Client();
  Web3Client ethClient;
  Credentials credentials;

  /// init method
  Web3dart._internal() {
    initEthClient();
  }

  factory Web3dart() {
    return _instance;
  }

  /// initEthClient
  initEthClient() async {
    ethClient = new Web3Client(
        'https://ropsten.infura.io/v3/fa89761e51884ca48dce5c0b6cfef565',
        httpClient);
    credentials = await ethClient.credentialsFromPrivateKey(
        "d1bdc683fbeb9fa0b4ceb26adb39eaffb21b16891ea28e4cf1bc3118fdd39295");
  }

  /// setUpPrivateKey
  setUpPrivateKey({String privateKey}) async {
    credentials = await ethClient.credentialsFromPrivateKey(privateKey);
  }

  /// getOwnerAddress
  void getOwnerAddress() async {
    const String rpcUrl = 'http://18.141.43.75:20000';
    EthereumAddress contractAddress =
        EthereumAddress.fromHex('0xfeae27388A65eE984F452f86efFEd42AaBD438FD');
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

  /// sendETHTransaction
  void sendETHTransaction({EtherAmount amount, String toAddress}) async {
    EthereumAddress toETHAddress = EthereumAddress.fromHex(toAddress);
    String resultString = await ethClient.sendTransaction(
        credentials,
        Transaction(
          to: toETHAddress,
          gasPrice: EtherAmount.inWei(BigInt.one),
          maxGas: 100000,
          value: amount,
        ),
        fetchChainIdFromNetworkId: true);

    print("sendTransaction resultString:$resultString");
  }

  /// sendERC20Transaction
  void sendERC20Transaction(
      {String contractAddress, BigInt amount, String toAddress}) async {
    EthereumAddress toETHAddress = EthereumAddress.fromHex(toAddress);
    final EthereumAddress contractAddr =
        EthereumAddress.fromHex(contractAddress);
    String abiCode =
        '''[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"spender","type":"address"},{"name":"tokens","type":"uint256"}],"name":"approve","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"from","type":"address"},{"name":"to","type":"address"},{"name":"tokens","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"tokenOwner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"acceptOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"drip","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"to","type":"address"},{"name":"tokens","type":"uint256"}],"name":"transfer","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"spender","type":"address"},{"name":"tokens","type":"uint256"},{"name":"data","type":"bytes"}],"name":"approveAndCall","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"newOwner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"tokenAddress","type":"address"},{"name":"tokens","type":"uint256"}],"name":"transferAnyERC20Token","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"tokenOwner","type":"address"},{"name":"spender","type":"address"}],"name":"allowance","outputs":[{"name":"remaining","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"payable":true,"stateMutability":"payable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":true,"name":"_to","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"tokens","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"tokenOwner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"tokens","type":"uint256"}],"name":"Approval","type":"event"}]''';
    final contract = DeployedContract(
        ContractAbi.fromJson(abiCode, 'TestingCoin'), contractAddr);
    final transferEvent = contract.function('transfer');

    String sendTransaction = await ethClient.sendTransaction(
        credentials,
        Transaction.callContract(
          gasPrice: EtherAmount.inWei(BigInt.from(300)),
          maxGas: 300000,
          contract: contract,
          function: transferEvent,
          parameters: [toETHAddress, amount],
        ),
        fetchChainIdFromNetworkId: true);
    print("sendTransaction result:$sendTransaction");
  }

  /// getETHClientDetail
  void getETHClientDetail() async {
    print("---------------------- getETHClientDetail ----------------------");
    print("getClientVersion:${await ethClient.getClientVersion()}");
    print("getBlockNumber:${await ethClient.getBlockNumber()}");
    print("getGasPrice:${await ethClient.getGasPrice()}");
    print(
        "getEtherProtocolVersion:${await ethClient.getEtherProtocolVersion()}");
    print("getMiningHashrate:${await ethClient.getMiningHashrate()}");
    print("getNetworkId:${await ethClient.getNetworkId()}");
    print("getPeerCount:${await ethClient.getPeerCount()}");
  }

  /// getAddressDetail
  void getAddressDetail() async {
    print("---------------------- getAddressDetail ----------------------");
    print("getBalance:${await ethClient.getBalance(
      EthereumAddress.fromHex('0x44f426bc9ac7a83521EA140Aeb70523C0a85945a'),
    )}");
    print("etTransactionCount:${await ethClient.getTransactionCount(
      EthereumAddress.fromHex('0x44f426bc9ac7a83521EA140Aeb70523C0a85945a'),
    )}");
    TransactionReceipt transactionReceipt = await ethClient.getTransactionReceipt(
        "0xfa0a7ed6a87b655f2302ce2d88d1d051c4eeef2af6e82de9850f3527a8106744");
    print("---------------------- hash data ----------------------");
    print(
        "transactionReceipt.contractAddress:${transactionReceipt.contractAddress}");
    print("transactionReceipt.gasUsed:${transactionReceipt.gasUsed}");
    print("transactionReceipt.from:${transactionReceipt.from}");
    print("transactionReceipt.to:${transactionReceipt.to}");
  }

  /// initNewWallet
  void initNewWallet() async {
    var rng = new Random.secure();
    Credentials random = EthPrivateKey.createRandom(rng);

    var address = await random.extractAddress();
    print("extract address: ${address.hex}");

    Wallet wallet =
        Wallet.createNew(random, 'password', Random(), scryptN: pow(2, 8));
    print("wallet json ${wallet.toJson()}");
  }
}

/// you can use web3dart
Web3dart web3dart = Web3dart();

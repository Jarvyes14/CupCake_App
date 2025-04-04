import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class BlockchainService {
  late Web3Client _client;
  late DeployedContract _contract;
  late Credentials _credentials;
  late EthereumAddress _contractAddress;
  final String _rpcUrl = "http://127.0.0.1:7545"; // Dirección de Ganache
  final String _privateKey = "0x976ca9291a35c587f3b1e800f6f43b62f15e271decb999ea4bf9ad7c4b67fa98"; // Usa una clave de Ganache

  BlockchainService() {
    initialize();
  }

  Future<void> initialize() async {
    try {
      _client = Web3Client(_rpcUrl, Client());
      _credentials = EthPrivateKey.fromHex(_privateKey);

      // Cargar el archivo JSON completo
      final String abiString = await rootBundle.loadString("assets/CupcakeOrder.json");
      final Map<String, dynamic> jsonAbi = jsonDecode(abiString);

      // Extraer solo el campo "abi"
      final String abi = jsonEncode(jsonAbi["abi"]);

      _contractAddress = EthereumAddress.fromHex("0x149359CbeCb4C865F561e2ab9360925341154EA9");

      _contract = DeployedContract(
        ContractAbi.fromJson(abi, "CupcakeOrder"),
        _contractAddress,
      );

    } catch (e) {
      print("Error al inicializar el contrato: $e");
    }
  }

  Future<void> addOrder(List<String> flavors, List<List<String>> ingredients) async {
    final function = _contract.function("addOrder");

    try {
      final transaction = Transaction.callContract(
        contract: _contract,
        function: function,
        parameters: [flavors, ingredients],
      );

      await _client.sendTransaction(
        _credentials,
        transaction,
        chainId: 1337, // ID de red de Ganache
      );
    } catch (e) {
      print("Error al registrar pedido: $e");
    }
  }
}

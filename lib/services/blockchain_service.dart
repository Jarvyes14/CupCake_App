import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart'; // Para interactuar con el nodo Ethereum

class BlockchainService {
  final String rpcUrl; // URL del nodo Ethereum
  final String privateKey; // Clave privada del usuario
  final String contractAddress; // Dirección del contrato desplegado

  late Web3Client _client;
  late Credentials _credentials;
  late DeployedContract _contract;

  BlockchainService({
    required this.rpcUrl,
    required this.privateKey,
    required this.contractAddress,
  }) {
    if (!privateKey.startsWith("0x") || privateKey.length != 66) {
      throw FormatException("Invalid private key format");
    }
    _client = Web3Client(rpcUrl, Client());
    _credentials = EthPrivateKey.fromHex(privateKey);
  }

  Future<void> initializeContract(String abi) async {
    final contractAbi = ContractAbi.fromJson(abi, "CupcakeOrders");
    final contractAddr = EthereumAddress.fromHex(contractAddress);
    _contract = DeployedContract(contractAbi, contractAddr);
  }

  Future<void> addOrder(List<String> flavors, List<List<String>> ingredients) async {
    final addOrderFunction = _contract.function("addOrder");
    print("Bandera 1");
    await _client.sendTransaction(
      _credentials,
      Transaction.callContract(
        contract: _contract,
        function: addOrderFunction,
        parameters: [flavors, ingredients],
      ),
      chainId: 5777, // Cambia esto si estás usando una red específica
    );
  }
}
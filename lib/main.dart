import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cupcake_provider.dart';
import 'pages/home_page.dart';
import 'services/blockchain_service.dart';
import 'screens/checkout_screen.dart';
import 'package:flutter/services.dart';

final blockchainService = BlockchainService(
  rpcUrl: "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID",
  privateKey: "0x4c0883a69102937d6231471b5dbb6204fe5129617082796e5e6f6d3c5d8a3a5e",
  contractAddress: "0x1234567890abcdef1234567890abcdef12345678",
);

Future<void> initializeBlockchainService() async {
  final abi = await rootBundle.loadString('assets/cupcake_orders_abi.json');
  await blockchainService.initializeContract(abi);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeBlockchainService();

  runApp(
    ChangeNotifierProvider(
      create: (context) => CupcakeProvider(),
      child: MyApp(blockchainService: blockchainService),
    ),
  );
}

class MyApp extends StatelessWidget {
  final BlockchainService blockchainService;

  MyApp({required this.blockchainService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/checkout': (context) => CheckoutScreen(blockchainService: blockchainService),
      },
    );
  }
}


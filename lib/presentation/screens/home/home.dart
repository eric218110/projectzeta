import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final reducer = BalanceReducer.create();

  @override
  void initState() {
    super.initState();
    reducer.addListener(_listener);
    reducer.onLoadBalanceByUser();
  }

  void _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    reducer.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: DimensionApplication.extraLarge),
                YourBalance(balance: reducer.balanceValue),
                const SizedBox(height: DimensionApplication.extraLarge),
                const ReceiveAndExpenseButton(),
                const SizedBox(height: DimensionApplication.extraLarge),
                const ShowCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

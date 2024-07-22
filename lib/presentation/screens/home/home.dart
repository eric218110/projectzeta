import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/store/reducer/reducer.dart';
import 'package:projectzeta/presentation/theme/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var balanceReducer = Provider.of<BalanceReducer>(context, listen: false);
      await balanceReducer.onLoadBalanceByUser();
    });
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
                Consumer<BalanceReducer>(
                  builder: (_, s, __) => YourBalance(balance: s.balanceValue),
                ),
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

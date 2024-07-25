import 'package:flutter/material.dart';
import 'package:projectzeta/domain/domain.dart';
import 'package:projectzeta/main/di/di.dart';
import 'package:projectzeta/presentation/components/components.dart';
import 'package:projectzeta/presentation/theme/colors.dart';
import 'package:projectzeta/presentation/theme/dimensions.dart';
import 'package:projectzeta/utils/utils.dart';

class RowExpenseData extends StatefulWidget {
  const RowExpenseData({super.key});

  @override
  State<RowExpenseData> createState() => _RowExpenseDataState();
}

class _RowExpenseDataState extends State<RowExpenseData> {
  late String today = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var dateFormat = getIt<FormateDate>();
      var dateFormatNow = await dateFormat.onFormatNow();
      setState(() {
        today = dateFormatNow;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionApplication.large,
      ),
      height: DimensionApplication.massive,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(context: context).h1(
                text: R.strings.date,
                color: SurfaceColors.lightGray,
              ),
              const SizedBox(width: DimensionApplication.base),
              Circle(
                diameter: DimensionApplication.extraSmall,
                borderWidth: DimensionApplication.extraSmall,
                color: SurfaceColors.lightGray,
              ),
              const SizedBox(width: DimensionApplication.base),
              CustomText(context: context).h1(text: today),
            ],
          )
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_mobile_dev/calculate_number/presentation/bloc/calculate_bloc.dart';
import 'package:test_mobile_dev/calculate_number/presentation/widgets/calculate_button.dart';
import 'package:test_mobile_dev/core/constants/app_sizes.dart';
import 'package:test_mobile_dev/core/extensions/context_extension.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonList = <String>['1', '2', '3', '4'];
    final controller = TextEditingController();

    void handleButtonPress(String buttonLabel) {
      final trimmedText = controller.text.trim();
      switch (buttonLabel) {
        case '1':
          context
              .read<CalculateBloc>()
              .add(CalculateTypeOne(number: trimmedText));
        case '2':
          context
              .read<CalculateBloc>()
              .add(CalculateTypeTwo(number: trimmedText));
        case '3':
          context
              .read<CalculateBloc>()
              .add(CalculateTypeThree(number: trimmedText));
        case '4':
          context
              .read<CalculateBloc>()
              .add(CalculateTypeFour(number: trimmedText));
        default:
          break;
      }
      FocusManager.instance.primaryFocus?.unfocus();
      controller.clear();
    }

    Future<void> errorAlert(CalculateError state) async {
      return showDialog(
        context: context,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: AlertDialog(
            content: SizedBox(
              height: Sizes.p100,
              child: Center(
                child: Text(
                  state.message,
                  style: context.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        minimum: REdgeInsets.symmetric(horizontal: Sizes.p36)
            .copyWith(top: Sizes.p100),
        child: Wrap(
          runSpacing: 20,
          children: [
            const Text('Enter some number: '),
            TextField(
              autofocus: true,
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
            SizedBox(
              height: 0.23.sh,
              child: GridView.count(
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / .4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: buttonList.map((e) {
                  return CalculateButton(
                    label: e,
                    function: () => handleButtonPress(e),
                  );
                }).toList(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Result: '),
                Gap.h8,
                BlocConsumer<CalculateBloc, CalculateState>(
                  listener: (_, state) {
                    if (state is CalculateError) errorAlert(state);
                  },
                  builder: (_, state) {
                    if (state is CalculateLoading) {
                      return const CupertinoActivityIndicator();
                    }
                    if (state is CalculateLoaded) {
                      return SizedBox(
                        height: 0.4.sh,
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: state.numbers
                                .map(
                                  (number) => Text(
                                    number.toString(),
                                    style: context.headlineSmall,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

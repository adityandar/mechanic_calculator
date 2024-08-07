import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/cubits/index.dart';
import 'package:mechanic_calculator/pages/index.dart';
import 'package:mechanic_calculator/styles/index.dart';

import '../../../components/my_snackbar.dart';

class ActionButtonBottomView extends StatelessWidget {
  const ActionButtonBottomView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(
                        ColorStyle.successColor,
                      ),
                      textStyle: WidgetStatePropertyAll(
                        TypoStyle.h3(context).copyWith(
                          color: ColorStyle.fullWhiteColor,
                        ),
                      ),
                    ),
                    onPressed: state.isLoading
                        ? null
                        : () {
                            if (state.componentAmount > 0) {
                              context
                                  .read<CalculatorCubit>()
                                  .saveCalculationData(
                                    context,
                                  );
                            } else {
                              MySnackbar.show(
                                // ignore: use_build_context_synchronously
                                context,
                                title: 'Waduh',
                                message: 'Jumlah komponen masih kosong',
                                contentType: ContentType.failure,
                              );
                            }
                          },
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            'SIMPAN',
                            style: TypoStyle.h3(context).copyWith(
                              color: ColorStyle.fullWhiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
                const Gap(24),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide.none,
                        ),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(
                        ColorStyle.dangerColor,
                      ),
                    ),
                    onPressed: state.isLoading
                        ? null
                        : context.read<CalculatorCubit>().cancel,
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            'BATAL',
                            style: TypoStyle.h3(context).copyWith(
                              color: ColorStyle.fullWhiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ],
            ),
            const Gap(24),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorStyle.blackColor,
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      ColorStyle.primaryBlueColor,
                      ColorStyle.primaryBlueColor2,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorStyle.blackColor.withOpacity(0.5),
                      blurRadius: 12,
                      offset: const Offset(0, 0),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lihat Catatan',
                      style: TypoStyle.b1(context).copyWith(
                        color: ColorStyle.fullWhiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: ColorStyle.fullWhiteColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

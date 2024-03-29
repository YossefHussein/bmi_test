import 'package:bmi_test/controller/cubit.dart';
import 'package:bmi_test/controller/states.dart';
import 'package:bmi_test/modules/confetti_screen.dart';
import 'package:bmi_test/shared/routes/main_routes.dart';
import 'package:bmi_test/shared/theme/theme.dart';
import 'package:bmi_test/shared/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiMainCubit, BmiStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Expanded(
                  child: Padding(
                    // note here I not use (EdgeInsets.all) because when use
                    // (EdgeInsets.all) will adding padding of Selected gender part
                    // to select Selected your height part
                    // when do this padding will be 40 not 20
                    padding: const EdgeInsets.symmetric(
                      horizontal: pPadding / 2,
                      vertical: pPadding / 3,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: sColor,
                        borderRadius: BorderRadius.circular(pBorderSize),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.height.tr().toUpperCase(),
                            style: TextStyle(
                              color: pColor,
                              fontSize: pMediumFontSize,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${BmiMainCubit.get(context).heightValue}',
                                style: TextStyle(
                                  color: pColor,
                                  fontSize: pLargeFontSize,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'cm',
                                style: TextStyle(
                                  color: pColor,
                                  fontSize: pLargeFontSize,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: BmiMainCubit.get(context)
                                .heightValue
                                .toDouble(),
                            max: 220,
                            min: 34,
                            inactiveColor: pColor,
                            activeColor: pColor,
                            label: context.read<BmiMainCubit>()
                                .heightValue
                                .toInt()
                                .toString(),
                            onChanged: (double value) {
                              BmiMainCubit.get(context).changeSlider(value);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                // move to age and weight screen
                Container(
                  width: double.infinity,
                  height: 50,
                  color: pColorResultButton,
                  child: TextButton(
                    child: Center(
                      child: Text(
                        LocaleKeys.whatAfterThat.tr().toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfettiScreen(
                            // this line to move to difference screen when call this screen
                            targetScreen: ageAndWeightScreenRoute,
                          ),
                        ),
                      );
                      //  Navigator.pushNamed(context,ageAndWeightScreenRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_picker/country_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskify/common/utils/constants.dart';
import 'package:taskify/common/widgets/appstyle.dart';
import 'package:taskify/common/widgets/custom_otn_btn.dart';
import 'package:taskify/common/widgets/height_spacer.dart';
import 'package:taskify/common/widgets/reusable_text.dart';

import '../../../common/widgets/custom_text.dart';
import 'otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();

  Country country = Country(
    phoneCode: "254",
    countryCode: "KE",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Kenya",
    example: "707600270",
    displayName: "Kenya",
    displayNameNoCountryCode: "Kenya",
    e164Key: "",
  );

  @override
  void dispose() {
    super.dispose();
    phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                child: Image.asset(
                  "assets/images/todo.png",
                  width: 300,
                ),
              ),
              const HeightSpacer(
                hieght: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: 16.w,
                ),
                child: ReusableText(
                  text: "Please enter your phone number",
                  style: appstyle(
                    17,
                    AppConsts.kLight,
                    FontWeight.w500,
                  ),
                ),
              ),
              const HeightSpacer(
                hieght: 20,
              ),
              Center(
                child: CustomTextField(
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              backgroundColor: AppConsts.kLight,
                              bottomSheetHeight: AppConsts.kHeight * 0.6,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  AppConsts.kRadius,
                                ),
                                topRight: Radius.circular(
                                  AppConsts.kRadius,
                                ),
                              ),
                            ),
                            onSelect: (code) {
                              setState(() {});
                            });
                      },
                      child: ReusableText(
                        text: "${country.flagEmoji} + ${country.phoneCode}",
                        style: appstyle(
                          18,
                          AppConsts.kBkDark,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  hintText: "Enter phone number",
                  hintStyle: appstyle(
                    16,
                    AppConsts.kBkDark,
                    FontWeight.w600,
                  ),
                  controller: phone,
                ),
              ),
              const HeightSpacer(
                hieght: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomOutlnBtn(
                  width: AppConsts.kWidth * 0.85,
                  height: AppConsts.kHeight * 0.07,
                  text: "Send Code",
                  color: AppConsts.kBkDark,
                  color2: AppConsts.kLight,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

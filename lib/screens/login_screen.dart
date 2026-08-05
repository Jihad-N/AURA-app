import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/core/utils/validator.dart';
import 'package:ecommerce_project/widgets/aura_logo.dart';
import 'package:ecommerce_project/widgets/custom_btn_outlined.dart';
import 'package:ecommerce_project/widgets/custom_button.dart';
import 'package:ecommerce_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-Image (1).png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  Spacer(flex: 2),
                  Column(
                    children: [
                      AuraLogo(),
                      Text(
                        'THE ART OF FINE HOROLOGY & JEWELRY',
                        style: AppTextStyles.bodyMedium,
                      ),
                    ],
                  ),
                  Spacer(flex: 1),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.background.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Text(
                              'Welcome Back',
                              style: AppTextStyles.blackHeadingSmall,
                            ),
                            Spacer(),
                            SizedBox(height: 10),
                            Text('Email', style: AppTextStyles.labelMedium),
                            CustomTextFormField(
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              hintText: 'Email Address',
                              isObsecureText: false,
                              validator: AppValidators.validateEmail,
                              icon: Icon(
                                Icons.email_outlined,
                                color: AppColors.onBackground,
                              ),
                              controller: _emailController,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Password',
                                  style: AppTextStyles.labelMedium,
                                ),
                                Text(
                                  'Forgot?',
                                  style: AppTextStyles.headlineSmall,
                                ),
                              ],
                            ),
                            CustomTextFormField(
                              hintText: 'Password',
                              isObsecureText: false,
                              validator: AppValidators.validatePassword,
                              icon: Icon(
                                Icons.lock_outline_rounded,
                                color: AppColors.onBackground,
                              ),
                              controller: _passwordController,
                              sufIcon:Icon(Icons.remove_red_eye_outlined,color: AppColors.darkPrimary,)
                            ),
                            CustomButton(
                              txt: 'SIGN IN ',
                              onPressed: () {
                                if (_formKey.currentState!.validate()){

                                }
                                else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('error')),
                                  );
                                }
                              },
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                'OR CONTINUE WITH',
                                style: AppTextStyles.bLabelSmall,
                              ),
                            ),
                            CustomBtnOutlined(),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'New to Aura? ',
                                  style: AppTextStyles.bodyMedium,
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    'SignUpScreen',
                                  ),
                                  child: Text(
                                    'Request Membership ',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(flex: 2),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('PRIVACY', style: AppTextStyles.bodyMedium),

                      Text('CONCIERGE', style: AppTextStyles.bodyMedium),
                      Text('STORES', style: AppTextStyles.bodyMedium),
                    ],
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_project/core/helper/show_error_snack_bar.dart';
import 'package:ecommerce_project/core/routes/app_routes.dart';
import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/core/utils/validator.dart';
import 'package:ecommerce_project/features/auth/screens/sign_in%20_with_google.dart';
import 'package:ecommerce_project/features/auth/services/auth_service.dart';
import 'package:ecommerce_project/shared/widgets/aura_logo.dart';
import 'package:ecommerce_project/shared/widgets/custom_btn_outlined.dart';
import 'package:ecommerce_project/shared/widgets/custom_button.dart';
import 'package:ecommerce_project/shared/widgets/custom_form_label.dart';
import 'package:ecommerce_project/shared/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future logIn() async {
      try {
        if (_formKey.currentState!.validate()) {
          setState(() {
            _isLoading = true;
          });
          await AuthService().logIn(
            email: _emailController.text,
            password: _passwordController.text,
          );
          Navigator.pushNamed(context, AppRoutes.home);
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('error')));
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = "An unknown error occurred.";
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email address is not valid.';
        }
        showErrorSnackBar(context, errorMessage);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }

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
                            FormFieldLabel(text: 'Email'),
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
                                FormFieldLabel(text: 'Password'),
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
                              sufIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.darkPrimary,
                              ),
                            ),
                            CustomButton(
                              txt: _isLoading ? 'Loading...' : 'SIGN IN ',
                              onPressed: _isLoading ? () {} : logIn,
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                'OR CONTINUE WITH',
                                style: AppTextStyles.bLabelSmall,
                              ),
                            ),
                            CustomBtnOutlined(
                              onPressed: () async {
                                UserCredential? userCredential =
                                    await signInWithGoogle();
                                if (userCredential != null) {
                                  Navigator.of(
                                    context,
                                  ).pushReplacementNamed(AppRoutes.home);
                                } else {
                                  showErrorSnackBar(
                                    context,
                                    'Sign-in failed. Please try again. And check your connection',
                                  );
                                }
                              },
                            ),
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
                                    AppRoutes.signup,
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

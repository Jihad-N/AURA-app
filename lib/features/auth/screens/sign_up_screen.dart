import 'package:ecommerce_project/core/helper/show_error_snack_bar.dart';
import 'package:ecommerce_project/core/routes/app_routes.dart';
import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/core/utils/validator.dart';
import 'package:ecommerce_project/features/auth/screens/sign_in%20_with_google.dart';
import 'package:ecommerce_project/features/auth/services/auth_service.dart';
import 'package:ecommerce_project/shared/widgets/aura_logo.dart';
import 'package:ecommerce_project/shared/widgets/custom_button.dart';
import 'package:ecommerce_project/shared/widgets/custom_icon_btn_outlined.dart';
import 'package:ecommerce_project/shared/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordConfirmController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future signUp() async {
      final authService = AuthService();
      try {
        if (_formKey.currentState!.validate()) {
          setState(() {
            _isLoading = true;
          });
          await authService.signUp(
            name: _nameController.text.trim(),
            email: _emailController.text.trim(),
            password: _passwordController.text,
            confirmPassword: _passwordConfirmController.text,
          );

          Navigator.pushNamed(context, AppRoutes.home);
        } else {
          showErrorSnackBar(context, 'error');
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
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: AppColors.background,
        title: AuraLogo(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          color: AppColors.background,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'Create Your Account',
                  style: AppTextStyles.displayLarge,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Begin your journey into the world of curated excellence.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width * 0.80,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full Name', style: AppTextStyles.labelMedium),
                      CustomTextFormField(
                        controller: _nameController,
                        validator: AppValidators.validateName,
                        hintText: 'Elias Thorne',
                        isObsecureText: false,
                        icon: Icon(null),
                      ),
                      const SizedBox(height: 16),
                      Text('Email Address', style: AppTextStyles.labelMedium),
                      CustomTextFormField(
                        controller: _emailController,
                        validator: AppValidators.validateEmail,
                        hintText: 'elias@aura.com',
                        isObsecureText: false,
                        icon: Icon(null),
                      ),
                      const SizedBox(height: 16),
                      Text('Password', style: AppTextStyles.labelMedium),
                      CustomTextFormField(
                        controller: _passwordController,
                        validator: AppValidators.validatePassword,
                        hintText: '*************',
                        isObsecureText: true,
                        icon: Icon(null),
                        sufIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.darkPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Confirm Password',
                        style: AppTextStyles.labelMedium,
                      ),
                      CustomTextFormField(
                        controller: _passwordConfirmController,
                        validator: AppValidators.validatePassword,
                        hintText: '*************',
                        isObsecureText: true,
                        icon: Icon(null),
                        sufIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.darkPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (onChanged) {}),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Receive exclusive previews, private gallery invitations, and horology insights.',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        txt: _isLoading ? 'Loading...' : 'CREATE ACCOUNT ',
                        radius: 25,
                        onPressed: _isLoading ? () {} : signUp,
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          'OR JOIN WITH',
                          style: AppTextStyles.labelMedium,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomIconBtnOutlined(
                        img: 'assets/images/Google-SVG.png',
                        onpressed: () async {
                          UserCredential? userCredential =
                              await signInWithGoogle();
                          if (userCredential != null) {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(AppRoutes.home);
                          } else {
                            showErrorSnackBar(
                              context,
                              'Sign-in failed. Please try again.',
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already part of the collective?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Sign In', style: AppTextStyles.link),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

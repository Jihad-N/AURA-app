import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/widgets/aura_app_logo.dart';
import 'package:ecommerce_project/widgets/custom_button.dart';
import 'package:ecommerce_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 2),
            Center(
              child: Text(
                'Create Your Account',
                style: AppTextStyles.displayLarge,
              ),
            ),
            Text(
              'Begin your journey into the world of curated excellence.',
              style: AppTextStyles.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Text('Full Name', style: AppTextStyles.labelMedium),
            CustomTextFormField(
              hintText: 'Elias Thorne',
              isObsecureText: false,
              icon: Icon(null),
              onChanged: (data) {},
            ),
            Text('Email Address', style: AppTextStyles.labelMedium),
            CustomTextFormField(
              hintText: 'elias@aura.com',
              isObsecureText: false,
              icon: Icon(null),
              onChanged: (data) {},
            ),
            Text('Password', style: AppTextStyles.labelMedium),
            CustomTextFormField(
              hintText: '*************',
              isObsecureText: true,
              icon: Icon(null),
              sufIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.darkPrimary,
              ),
              onChanged: (data) {},
            ),
            Spacer(),
            Row(
              children: [
                Checkbox(value: false, onChanged: (onChanged) {}),
                Flexible(
                  child: Text(
                    'Receive exclusive previews, private gallery invitations, and horology insights.',
                  ),
                ),
              ],
            ),
            CustomButton(txt: 'CREATE ACCOUNT ', radius: 25),
            Spacer(),
            Center(
              child: Text('OR JOIN WITH', style: AppTextStyles.labelMedium),
            ),

            Spacer(flex: 2),
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
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}

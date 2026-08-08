import 'package:ecommerce_project/core/theme/app_colors.dart';
import 'package:ecommerce_project/core/theme/app_text_styles.dart';
import 'package:ecommerce_project/core/utils/validator.dart';
import 'package:ecommerce_project/features/home/widgets/custom_dark_txt_btn.dart';
import 'package:ecommerce_project/shared/widgets/custom_bottom_nav_bar.dart';
import 'package:ecommerce_project/shared/widgets/custom_form_label.dart';
import 'package:ecommerce_project/shared/widgets/custom_simple_app_bar.dart';
import 'package:ecommerce_project/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _controller = TextEditingController();
  // ignore: unused_field
  String? _selectedCategory;
  final List<String> _categoryOptions = ['Rings', 'Earings', 'Necklaces'];
  final List<String> _selectedMaterials = [];
  final int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SimpleCustomAppBar(),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: currentIndex),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            width: double.infinity,
            color: AppColors.background,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('New Inventory', style: AppTextStyles.headlineSmall),
                Text(
                  'Document your latest exquisite acquisition to the Lumina catalog.',
                  style: AppTextStyles.bodyLarge,
                ),
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    color: AppColors.outlineVariant,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.outline,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add_a_photo_outlined, size: 30),
                      ),
                      Text(
                        'UPLOAD PRODUCT VISUAL',
                        style: AppTextStyles.labelMedium,
                      ),
                      Text(
                        'High-resolution recommended (JPG, PNG)',
                        style: AppTextStyles.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Form(
                  key: AddProduct._formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      FormFieldLabel(text: 'PRODUCT NAME'),
                      CustomTextFormField(
                        hintText: 'e.g. OMEGA Speedmaster \'57',
                        isObsecureText: false,
                        icon: Icon(null),
                        controller: _controller,
                        validator: AppValidators.validateName,
                      ),
                      SizedBox(height: 10),
                      FormFieldLabel(text: 'CATEGORY'),
                      DropdownMenu<String>(
                        controller: _controller,
                        width: 400,
                        hintText: 'Select heritage class',
                        enableSearch: true,
                        requestFocusOnTap: true,
                        onSelected: (String? value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                        dropdownMenuEntries: _categoryOptions
                            .map<DropdownMenuEntry<String>>((String option) {
                              return DropdownMenuEntry<String>(
                                value: option,
                                label: option,
                              );
                            })
                            .toList(),
                      ),
                      SizedBox(height: 10),
                      FormFieldLabel(text: 'MARKET VALUE'),
                      CustomTextFormField(
                        keyboardtype: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        hintText: '\$  0.00',
                        isObsecureText: false,
                        icon: Icon(null),
                        controller: _controller,
                        validator: AppValidators.validatePrice,
                      ),
                      FormFieldLabel(text: 'PRIMARY MATERIALS'),
                      PopupMenuButton<void>(
                        offset: const Offset(0, 50),
                        itemBuilder: (BuildContext context) {
                          final List<String> _options = [
                            '18K Gold',
                            'Platinum',
                            'Diamond',
                            'Sapphire',
                            'Silver',
                            'other',
                          ];
                          return _options.map((option) {
                            return PopupMenuItem<void>(
                              enabled: false,
                              child: StatefulBuilder(
                                builder: (context, menuSetState) {
                                  final isSelected = _selectedMaterials
                                      .contains(option);
                                  return CheckboxListTile(
                                    title: Text(option),
                                    value: isSelected,
                                    contentPadding: EdgeInsets.zero,
                                    onChanged: (bool? checked) {
                                      setState(() {
                                        if (checked == true) {
                                          _selectedMaterials.add(option);
                                        } else {
                                          _selectedMaterials.remove(option);
                                        }
                                      });
                                      menuSetState(() {});
                                    },
                                  );
                                },
                              ),
                            );
                          }).toList();
                        },
                        child: IgnorePointer(
                          child: CustomTextFormField(
                            controller: TextEditingController(
                              text: _selectedMaterials.join(', '),
                            ),
                            hintText: 'Select Materials',
                            isObsecureText: false,
                            icon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                      FormFieldLabel(text: 'ARTISANAL DESCRIPTION'),
                      TextFormField(
                        controller: TextEditingController(),
                        maxLines: 5,
                        minLines: 3,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        validator: (value) => AppValidators.validateText(
                          value,
                          fieldName: 'Description',
                          minLength: 10,
                          maxLength: 500,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          hintText: 'Enter product description',
                        ),
                      ),
                      Center(
                        child: CustomDarkTxtBtn(
                          txt: 'SAVE MASTERPIECE',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/logic/add_cubit/add_product_cubit.dart';
import 'package:iti_final_project/screens/add_screen/widgets/select_image.dart';
import 'package:iti_final_project/widgets/Custom_Text_Form_Field.dart';
import 'package:iti_final_project/widgets/custom_rounded_button.dart';
import 'package:iti_final_project/widgets/loading_animation_progress.dart';
import 'package:iti_final_project/widgets/row_bar_with_icons.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: Builder(builder: (context) {
        final cubit = AddProductCubit.get(context);
        return Scaffold(
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: PaddingSize.padding21width),
            child: BlocConsumer<AddProductCubit, AddProductState>(
              listener: (context, state) {
                if (state is AddProductSuccesState) {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      padding: EdgeInsets.all(PaddingSize.padding20h),
                      body: Text(
                        AppStrings.productAddedSuccessfully,
                        style: Styles.textStyle14Medium.copyWith(
                          color: kBlackColor,
                        ),
                      )).show();
                  cubit.titleController.clear();
                  cubit.categoryController.clear();
                  cubit.priceController.clear();
                  cubit.descripController.clear();
                  cubit.isLoading = false;
                }
                if (state is AddProductLoadingState) {
                  cubit.isLoading = true;
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        RowBarWithIcons(
                          text: AppStrings.addProduct,
                        ),
                        SizedBox(
                          height: PaddingSize.padding20h,
                        ),
                        const AddProductSelectImage(),
                        SizedBox(
                          height: PaddingSize.padding6h,
                        ),
                        CustomTextFormField(
                          hintText: 'Enter Title',
                          controller: cubit.titleController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return '* Title is required';
                            }
                            return null;
                          },
                          textOnChanged: (val) {},
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: PaddingSize.padding6h,
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.showCategoryDialog(context, size);
                          },
                          child: CustomTextFormField(
                            hintText: 'Enter Category',
                            controller: cubit.categoryController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return '* Category is required';
                              }
                              return null;
                            },
                            textOnChanged: (val) {},
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: PaddingSize.padding6h,
                        ),
                        CustomTextFormField(
                          hintText: 'Enter Price',
                          controller: cubit.priceController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return '* Price is required';
                            }
                            return null;
                          },
                          textOnChanged: (val) {},
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: PaddingSize.padding6h,
                        ),
                        CustomTextFormField(
                          hintText: 'Enter Description',
                          controller: cubit.descripController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return '* Discription is required';
                            }
                            return null;
                          },
                          textOnChanged: (val) {},
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: PaddingSize.padding10h,
                        ),
                        cubit.isLoading
                            ? const LoadingAnimationProgress()
                            : CustomRoundedButton(
                                buttonText: AppStrings.addProduct,
                                onPressed: () => cubit.addProducts(context),
                                heroTag: AppStrings.addTag,
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}

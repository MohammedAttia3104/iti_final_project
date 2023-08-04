import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/app_strings.dart';
import 'package:iti_final_project/core/utils/constants.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:iti_final_project/models/product_model/product_model.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  static AddProductCubit get(context) => BlocProvider.of(context);

  File? myImage;
  final titleController = TextEditingController();
  final descripController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? url;
  bool isLoading = false;

  void selectImage({ImageSource? source}) {
    ImagePicker.platform
        .getImageFromSource(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        myImage = File(value.path);
        Navigator.pop(navigatorKey.currentContext!);
        emit(AddProductImageSavedState());
      }
    });
  }

  showCategoryDialog(BuildContext context, size) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            AppStrings.productData,
            style: Styles.textStyle22Bold,
          ),
          content: SizedBox(
            width: 30.0.w,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: CategoryTitles.categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    categoryController.text =
                        CategoryTitles.categoryList[index];
                    emit(AddedProductToCategoryState());
                    Navigator.canPop(context) ? Navigator.pop(context) : null;
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        color: kPrimaryFontColor,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0.r),
                        child: Text(
                          CategoryTitles.categoryList[index],
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 20.0.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> addProducts(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (myImage != null) {
        emit(AddProductLoadingState());
        final productId = const Uuid().v4();
        try {
          final ref = FirebaseStorage.instance
              .ref()
              .child("products Image")
              .child('${productId}jpg');
          await ref.putFile(myImage!);
          url = await ref.getDownloadURL();
          createSingleProduct(
            title: titleController.text,
            id: productId,
            category: categoryController.text,
            image: url!,
            price: priceController.text,
            description: descripController.text,
          );
          emit(AddProductSuccesState());
        } catch (e) {
          emit(AddProductErrorState());
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  title: "Error",
                  padding: EdgeInsets.all(PaddingSize.padding20h),
                  body: Text(e.toString()))
              .show();
          // Fluttertoast.showToast(
          //   msg: 'An Error Occured',
          //   webBgColor: kRedColor,
          // );
        }
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: "Error",
            padding: EdgeInsets.all(PaddingSize.padding20h),
            body: Text(
              "Please Select a Product Image",
              style: Styles.textStyle20Extra.copyWith(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
            )).show();
        // Fluttertoast.showToast(
        //   msg: 'Please Select a Product Image',
        //   webBgColor: kRedColor,
        // );
      }
    }
  }

  void createSingleProduct({
    required String title,
    required String category,
    required String image,
    required String price,
    required String description,
    required var id,
  }) {
    ProductModel model = ProductModel(
      title: title,
      category: category,
      descrip: description,
      image: image,
      uId: id,
      price: price,
    );
    FirebaseFirestore.instance
        .collection("products")
        .doc(id)
        .set(model.toJson());
  }
}

class CategoryTitles {
  static List<String> categoryList = [
    'Foods',
    'Snacks',
    'Drinks',
    'Snacks',
    'Foods',
  ];
}

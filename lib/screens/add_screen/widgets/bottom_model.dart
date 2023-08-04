import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iti_final_project/logic/add_cubit/add_product_cubit.dart';

class AddProductBottomModel extends StatefulWidget
    implements PreferredSizeWidget {
  const AddProductBottomModel({Key? key, required this.cubit})
      : super(key: key);
  final AddProductCubit cubit;

  @override
  State<AddProductBottomModel> createState() => _AddProductBottomModelState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _AddProductBottomModelState extends State<AddProductBottomModel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please Select Image way',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          widget.cubit.selectImage(source: ImageSource.camera),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          widget.cubit.selectImage(source: ImageSource.gallery),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.image_search_sharp,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

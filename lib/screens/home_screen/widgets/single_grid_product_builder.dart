import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/utils/app_colors.dart';
import 'package:iti_final_project/core/utils/size_config.dart';
import 'package:iti_final_project/core/utils/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SingleGridProductBuilder extends StatefulWidget {
  SingleGridProductBuilder({
    super.key,
    required this.title,
    required this.descrip,
    required this.id,
    required this.image,
    required this.price,
    this.category = '',
  });

  final String title;
  final String descrip;
  final String id;
  final String image;
  final String price;
  String category = '';

  @override
  State<SingleGridProductBuilder> createState() =>
      _SingleGridProductBuilderState();
}

class _SingleGridProductBuilderState extends State<SingleGridProductBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 230.0.h,
              width: 150.0.w,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: kPrimaryColor,
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(PaddingSize.padding7h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(27.0.r),
                            ),
                          ),
                          width: 140.0.w,
                          height: 120.0.h,
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Center(
                              child: LoadingAnimationWidget.discreteCircle(
                                size: 50.0.sp,
                                color: kPrimaryColor,
                                secondRingColor: kWhiteColor,
                                thirdRingColor: kBlackColor,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            imageUrl: widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: PaddingSize.padding6h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle16Bold,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$',
                                  style: Styles.textStyle16Bold.copyWith(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                Text(
                                  widget.price,
                                  style: Styles.textStyle16Bold,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.descrip,
                          style: Styles.textStyle10Regular,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: PaddingSize.padding10h,
                    ),
                    FloatingActionButton.extended(
                      label: const Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 12,
                          color: kWhiteColor,
                        ),
                      ),
                      backgroundColor: kPrimaryColor,
                      icon: Icon(
                        Icons.add_shopping_cart,
                        size: 12.0.r,
                      ),
                      onPressed: () {},
                      heroTag: 'b1',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

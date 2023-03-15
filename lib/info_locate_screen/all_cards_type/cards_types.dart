import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../widgets/custom_avatar.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_icon_btn.dart';

class AllCards extends StatelessWidget {
  AllCards({super.key});

  Map<int, Icon> iconListMap = const {
    0: Icon(CupertinoIcons.location),
    1: Icon(CupertinoIcons.calendar),
    2: Icon(CupertinoIcons.car_detailed),
    3: Icon(CupertinoIcons.airplane),
    4: Icon(CupertinoIcons.video_camera_solid),
    5: Icon(CupertinoIcons.app_badge_fill),
    6: Icon(CupertinoIcons.map),
    7: Icon(CupertinoIcons.exclamationmark_octagon_fill),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Type Cards'),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Stack(
                children: [
                  CustomContainer(
                      width: 20.h,
                      height: 20.h,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Moving',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '21',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '23%',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      right: 3.w,
                      bottom: 3.w,
                      child: CustomAvatar(
                          icon: Icons.car_crash,
                          foregroundColor: Theme.of(context).primaryColor)),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              FittedBox(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 3; i++)
                      CustomIconBtn(
                          icon: iconListMap.containsKey(i)
                              ? iconListMap[i]!.icon
                              : Icons.apple,
                          title: '45 km')

                    // Padding(
                    //   padding: const EdgeInsets.only(right: 8),
                    //   child: CustomContainer(
                    //     buttonRadius: 14,
                    //     onTap: () => print('taped'),
                    //     child: Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           horizontal: 5.w, vertical: 2.w),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           const RotatedBox(
                    //               quarterTurns: 3, child: Icon(Icons.key)),
                    //           SizedBox(
                    //             width: 2.w,
                    //           ),
                    //           if (i == 0)
                    //             const Text(
                    //               'on',
                    //             ),
                    //           if (i == 1)
                    //             const Text(
                    //               '45 km',
                    //             ),
                    //           if (i == 2)
                    //             const Text(
                    //               '04',
                    //             ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              // SizedBox(
              //   height: 10.h,
              // ),
              Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Stack(
                  children: [
                    Container(
                      // width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).cardColor, width: 2),
                          // color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          CustomContainer(
                              width: double.infinity,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'KA-01-A-1234',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      'Brigade Buena Vista, cheemasandra, Benglaluru - 560002, Karnataka INDIA',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  // color: Theme.of(context).cardColor,
                                  border: Border.all(
                                      color: Theme.of(context).cardColor,
                                      width: 1),
                                  // color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              // height: 8.h,
                              child: Container(
                                height: 7.h,
                              ))
                        ],
                      ),
                    ),
                    Positioned(
                        right: 5.w,
                        top: 2.w,
                        child: Icon(
                          // i == 0
                          //     ?
                          Icons.bookmark,
                          // : Icons.bookmark_border_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 25.sp,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                    3,
                    (index) => CustomAvatar(
                        bgColor: index == 0
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).cardColor,
                        foregroundColor: index == 0 ? Colors.white : null,
                        icon: iconListMap.containsKey(index)
                            ? iconListMap[index]!.icon
                            : Icons.apple),
                  )
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Stack(
                  children: [
                    Container(
                        // width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).cardColor, width: 2),
                            // color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            CustomContainer(
                              width: double.infinity,
                              height: 15.h,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Image.asset(
                                  "assets/app-design/images/map_route.png"),
                            ),
                            // Lottie.network(
                            //     "https://assets6.lottiefiles.com/packages/lf20_ug4q6zc4.json",
                            //     height: 100),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'KA-01-A-1234',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              'Brigade Buena Vista, cheemasandra, Benglaluru - 560002, Karnataka INDIA',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'USER: SEQUEL_BLR',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            const Text(
                                              '08/11/2022 / 01:10:23',
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ...List.generate(
                                      6,
                                      (index) => CustomIconBtn(
                                            icon: iconListMap.containsKey(index)
                                                ? iconListMap[index]!.icon
                                                : Icons.apple,
                                            title: '45 km',
                                            direction: Axis.vertical,
                                          ))
                                ],
                              ),
                            ),
                          ],
                        )),
                    Positioned(
                        right: 5.w,
                        top: 2.w,
                        child: Icon(
                          // i == 0
                          //     ?
                          Icons.more_horiz,
                          // : Icons.bookmark_border_outlined,
                          color: Colors.grey,
                          size: 25.sp,
                        ))
                  ],
                ),
              ),

              SizedBox(
                height: 23.h,
              )

              //ElevatedButton(onPressed: (){}, child: ,style: ButtonStyle(),)
            ],
          ),
        ),
      ),
    );
  }
}

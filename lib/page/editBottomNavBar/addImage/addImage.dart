// ignore_for_file: prefer_const_constructors, unused_element, avoid_print, sort_child_properties_last, prefer_final_fields, no_leading_underscores_for_local_identifiers, unused_field, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/editBottomNavBar/addImage/addImageController.dart';

// import 'package:video_player/video_player.dart';

class AddImagePage extends StatefulWidget {
  const AddImagePage({Key key}) : super(key: key);

  @override
  State<AddImagePage> createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage>
    with TickerProviderStateMixin {
  AddImageController _addImageController = Get.put(AddImageController());

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    getImagesPath();
    super.initState();
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>open_camera<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  List<AssetPathEntity> albumlist = [];
  List<AssetEntity> mediaList = [];
  AssetEntity selectedFile;
  AssetPathEntity selectedModel;
  getImagesPath() async {
    final PermissionState _ps = await PhotoManager.requestPermissionExtend();
    print("check auth ${_ps.isAuth}");
    if (_ps.isAuth) {
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );

      final List<AssetEntity> entities =
          await paths.first.getAssetListPaged(page: 0, size: 50);
      setState(() {
        albumlist = paths;
        mediaList = entities;
        selectedModel = albumlist.first;
        selectedFile = mediaList.first;
        // selectedAlbums.clear();
        // selectedAlbums.add(selectedFile);
      });
    } else {}
    // printFile(selectedFile);
  }

  // VideoPlayerController controller;
  // Future<File> printFile(AssetEntity selected) async {
  //   var filetest = await selected.file;
  //   if (controller != null && controller.value.isPlaying) {
  //     setState(() {
  //       controller.pause();
  //     });
  //   }
  //   if (selectedFile.type == AssetType.video) {
  //     controller = VideoPlayerController.file(filetest,
  //         videoPlayerOptions: VideoPlayerOptions())
  //       ..initialize().then((_) {
  //         controller.play();
  //         setState(() {});
  //       });
  //     if (controller.value.isPlaying) {
  //       controller.pause();
  //     }
  //   }
  //   return filetest;
  // }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>open_camera<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        editAppBar(context: context, name: 'Add Image'),
        _tab(),
        DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(20),
          elevation: 0,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_sharp, size: 30),
          items: getItems(),
          value: selectedModel.name,
          onChanged: (String d) {
            setState(() {
              albumlist.forEach(((element) {
                if (element.name == d) {
                  selectedModel = element;
                  selectmedia(element);
                }
              }));
            });
          },
        )),
_tabBarView()
      ],
    ));
  }

  List getItems() {
    return albumlist
            .map((e) => DropdownMenuItem(
                  child: Text(
                    e.name,
                    style: TextStyle(color: Color(AppColor.grey), fontSize: 20),
                  ),
                  value: e.name,
                ))
            .toList() ??
        [];
  }

  selectmedia(AssetPathEntity d) async {
    final List<AssetEntity> entities = await d.getAssetListPaged(
      page: 0,
      size: 50,
    );
    setState(() {
      mediaList = entities;
      selectedFile = mediaList.first;
      selectedAlbums.clear();
      selectedAlbums.add(selectedFile);
      // if (state == AppState.picked) imagecroper();
    });
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Gallery Bulltom <<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget nextButton(
      {double height,
      double width,
      double radius,
      String image,
      text,
      EdgeInsets margin,
      onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(AppColor.yellow).withOpacity(0.3),
                  blurRadius: 3,
                  offset: Offset(0, 5))
            ],
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [Color(0xFFFA7F08), Color(0xFFF24405)])),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetPath.editBottomNavBar + image,
              height: 30,
            ),
            SizedBox(width: 20),
            Text(text,
                style: TextStyle(
                  fontFamily: AppFont.Medium,
                  fontSize: 18,
                  color: Color(AppColor.white),
                )),
          ],
        )),
      ),
    );
  }

// TabBarView
  TabController _tabController;
  Widget _tab() {
    // ignore: prefer_const_literals_to_create_immutables
    return TabBar(
        controller: _tabController,
        indicatorColor: Color(AppColor.orange),
        automaticIndicatorColorAdjustment: true,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Color(AppColor.yellow),
        labelPadding: EdgeInsets.all(10),
        tabs: [
          Text(
            'Image',
            style: TextStyle(fontFamily: AppFont.SemiBold, fontSize: 18),
          ),
          Text(
            'PixaBay',
            style: TextStyle(fontFamily: AppFont.SemiBold, fontSize: 18),
          ),
          Text(
            'Unsplash',
            style: TextStyle(fontFamily: AppFont.SemiBold, fontSize: 18),
          ),
        ]);
  }

  Widget _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        grid(count: mediaList.length),
        Center(
          child: Text("second"),
        ),
        gridView()
      ],
    );
  }

  bool ismultipleEnable = false;
  List<AssetEntity> selectedAlbums = <AssetEntity>[].obs;
  Widget grid({count, double height}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 80, left: 10, right: 10),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            // mainAxisExtent: height,
          ),
          itemCount: count,
          itemBuilder: (_, i) {
            return FutureBuilder(
                future: mediaList[i].thumbnailData,
                // ignore: missing_return
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      // bool isSelected = false;
                      return GestureDetector(
                        // onLongPress: () {
                        //   setState(() {
                        //     ismultipleEnable = true;
                        //   });
                        // },
                        onTap: () {
                          setState(() {
                            // if (!ismultipleEnable) {
                            //   selectedAlbums.clear();
                            //   print(
                            //       "  =========>>>>>>>>>>>>>>>>>>    $selectedAlbums");
                            // }
                            selectedFile = mediaList[i];

                            print(
                                " ==============++++++++++++++++++))))))))((((((((()))))))))  ${selectedFile = mediaList[i]}");
                            if (selectedAlbums.contains(mediaList[i])) {
                              selectedAlbums.remove(mediaList[i]);
                            } else {
                              selectedAlbums.add(mediaList[i]);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: MemoryImage(
                                    snapshot.data,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    }
                  } else {
                    return Container(
                      color: Colors.transparent,
                    );
                  }
                });
          }),
    );
  }
}

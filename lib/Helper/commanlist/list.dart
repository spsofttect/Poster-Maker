import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:poster_maker/Helper/utlity.dart';

List newShimmerRatio = [1.78, 1, 0.56, 0.56, 1, 1.78];

List newShimmer = [
  '${AssetPath.poster}1 (6).jpg',
  '${AssetPath.poster}stop-food-waste-day.jpg',
  '${AssetPath.poster}1 (6).png',
  '${AssetPath.poster}Poetry-And-The-Creative-Mind-Day.jpg',
  '${AssetPath.poster}Untitled-20.jpg',
  '${AssetPath.poster}1 (7).jpg',
  '${AssetPath.poster}parshuram-jayanti.png',
  '${AssetPath.poster}1 (7).png',
  '${AssetPath.poster}National-Garlic-Day.jpg',
  '${AssetPath.poster}1 (8).jpg',
];

List item2 = [
  '${AssetPath.poster}1 (6).jpg',
  '${AssetPath.poster}1 (6).png',
  '${AssetPath.poster}1 (7).jpg',
  '${AssetPath.poster}1 (7).png',
  '${AssetPath.poster}1 (8).jpg',
  '${AssetPath.poster}1 (8).png',
  '${AssetPath.poster}1 (9).png',
  '${AssetPath.poster}1 (10).png',
  '${AssetPath.poster}1 (11).png',
  '${AssetPath.poster}1 (12).png',
  '${AssetPath.poster}1 (1).jpg',
  '${AssetPath.poster}1 (1).png',
  '${AssetPath.poster}1 (2).jpg',
  '${AssetPath.poster}1 (2).png',
  '${AssetPath.poster}1 (3).jpg',
  '${AssetPath.poster}1 (3).png',
  '${AssetPath.poster}1 (4).jpg',
  '${AssetPath.poster}1 (4).png',
  '${AssetPath.poster}1 (5).jpg',
  '${AssetPath.poster}1 (5).png',
  '${AssetPath.poster}1 (6).jpg',
  '${AssetPath.poster}1 (6).png',
  '${AssetPath.poster}1 (7).jpg',
  '${AssetPath.poster}1 (7).png',
  '${AssetPath.poster}1 (8).jpg',
  '${AssetPath.poster}1 (8).png',
  '${AssetPath.poster}1 (9).png',
  '${AssetPath.poster}1 (10).png',
  '${AssetPath.poster}1 (11).png',
  '${AssetPath.poster}1 (12).png',
  '${AssetPath.poster}1 (1).jpg',
  '${AssetPath.poster}1 (1).png',
  '${AssetPath.poster}1 (2).jpg',
  '${AssetPath.poster}1 (2).png',
  '${AssetPath.poster}1 (3).jpg',
  '${AssetPath.poster}1 (3).png',
  '${AssetPath.poster}1 (4).jpg',
  '${AssetPath.poster}1 (4).png',
  '${AssetPath.poster}1 (5).jpg',
  '${AssetPath.poster}1 (5).png',
  '${AssetPath.poster}1 (6).jpg',
  '${AssetPath.poster}1 (6).png',
  '${AssetPath.poster}1 (7).jpg',
  '${AssetPath.poster}1 (7).png',
  '${AssetPath.poster}1 (8).jpg',
  '${AssetPath.poster}1 (8).png',
  '${AssetPath.poster}1 (9).png',
  '${AssetPath.poster}1 (10).png',
  '${AssetPath.poster}1 (11).png',
  '${AssetPath.poster}1 (12).png',
  '${AssetPath.poster}1 (1).jpg',
  '${AssetPath.poster}1 (1).png',
  '${AssetPath.poster}1 (2).jpg',
  '${AssetPath.poster}1 (2).png',
  '${AssetPath.poster}1 (3).jpg',
  '${AssetPath.poster}1 (3).png',
  '${AssetPath.poster}1 (4).jpg',
  '${AssetPath.poster}1 (4).png',
  '${AssetPath.poster}1 (5).jpg',
  '${AssetPath.poster}1 (5).png',
  '${AssetPath.poster}1 (6).jpg',
  '${AssetPath.poster}1 (6).png',
  '${AssetPath.poster}1 (7).jpg',
  '${AssetPath.poster}1 (7).png',
  '${AssetPath.poster}1 (8).jpg',
  '${AssetPath.poster}1 (8).png',
  '${AssetPath.poster}1 (9).png',
  '${AssetPath.poster}1 (10).png',
  '${AssetPath.poster}1 (11).png',
  '${AssetPath.poster}1 (12).png',
];
List homePageBannerData = [
  '${AssetPath.poster}National-Garlic-Day.jpg',
  '${AssetPath.poster}parshuram-jayanti.png',
  '${AssetPath.poster}Tagore-jayanti.png',
  '${AssetPath.poster}stop-food-waste-day.jpg',
  '${AssetPath.poster}Poetry-And-The-Creative-Mind-Day.jpg',
  '${AssetPath.poster}Untitled-20.jpg',
  '${AssetPath.poster}National-Garlic-Day.jpg',
  '${AssetPath.poster}parshuram-jayanti.png',
  '${AssetPath.poster}Tagore-jayanti.png',
  '${AssetPath.poster}stop-food-waste-day.jpg',
  '${AssetPath.poster}Poetry-And-The-Creative-Mind-Day.jpg',
  '${AssetPath.poster}Untitled-20.jpg',
  '${AssetPath.poster}National-Garlic-Day.jpg',
  '${AssetPath.poster}parshuram-jayanti.png',
  '${AssetPath.poster}Tagore-jayanti.png',
  '${AssetPath.poster}stop-food-waste-day.jpg',
  '${AssetPath.poster}Poetry-And-The-Creative-Mind-Day.jpg',
  '${AssetPath.poster}Untitled-20.jpg',
  '${AssetPath.poster}National-Garlic-Day.jpg',
  '${AssetPath.poster}parshuram-jayanti.png',
  '${AssetPath.poster}Tagore-jayanti.png',
  '${AssetPath.poster}stop-food-waste-day.jpg',
  '${AssetPath.poster}Poetry-And-The-Creative-Mind-Day.jpg',
  '${AssetPath.poster}Untitled-20.jpg',
];
List favourit = [];

List posterImage = [
  '${AssetPath.poster}National-Garlic-Day.jpg',
  '${AssetPath.poster}parshuram-jayanti.png',
  '${AssetPath.poster}Tagore-jayanti.png',
  '${AssetPath.poster}stop-food-waste-day.jpg',
  '${AssetPath.poster}Poetry-And-The-Creative-Mind-Day.jpg',
  '${AssetPath.poster}Untitled-20.jpg',
];

class NewVideoAndStoryOrPostMix {
  bool? isVideo;
  String? url;
  bool? isLike;
  NewVideoAndStoryOrPostMix({
    this.isVideo,
    this.url,
    this.isLike,
  });
}

List<NewVideoAndStoryOrPostMix> homePageNewData = [
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (6).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: true, url: "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (6).png', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (7).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (7).png', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (8).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (4).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (6).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (6).png', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (7).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (7).png', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (8).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "https://www.w3schools.com/html/mov_bbb.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (4).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4", isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (6).png', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: true, url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4", isLike: false),
];

List<NewVideoAndStoryOrPostMix> item = [
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (6).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (6).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (6).jpg', isLike: false),
  NewVideoAndStoryOrPostMix(isVideo: false, url: '${AssetPath.poster}1 (6).jpg', isLike: false),
];

final AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();

final ScrollController homePageController = ScrollController();
RxBool isScroll = false.obs;

final ScrollController categoryPageController = ScrollController();

final ScrollController customPageController = ScrollController();

final ScrollController favouritePageController = ScrollController();

final ScrollController myPostPageController = ScrollController();

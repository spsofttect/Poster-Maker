import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:poster_maker/Helper/utlity.dart';

List item = [
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
List banner = [
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
List favourit = [
];

List posterImage = [
  '${AssetPath.poster}National-Garlic-Day.jpg',
  '${AssetPath.poster}parshuram-jayanti.png',
  '${AssetPath.poster}Tagore-jayanti.png',
  '${AssetPath.poster}stop-food-waste-day.jpg',
  '${AssetPath.poster}Poetry-And-The-Creative-Mind-Day.jpg',
  '${AssetPath.poster}Untitled-20.jpg',
];

class NewVideoAndStoryOrPostMix {
  bool isVideo;
  String url;
  bool isLike;
  NewVideoAndStoryOrPostMix({
    this.isVideo,
    this.url,
    this.isLike,
  });
}

List<NewVideoAndStoryOrPostMix> item3 = [
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (6).jpg',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: true,
      url:
          "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4",isLike:false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (6).png',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (7).jpg',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (7).png',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (8).jpg',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: true,
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (4).jpg',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (6).jpg',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (6).png',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (7).jpg',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: true,
      url:
          "https://vod-progressive.akamaized.net/exp=1669815597~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1919%2F18%2F459597053%2F2031780851.mp4~hmac=8178f15f67b1e78dd0ea145ac856bc6b616de89a73b334ec5e3a80e097eb8852/vimeo-prod-skyfire-std-us/01/1919/18/459597053/2031780851.mp4",isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (7).png',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (8).jpg',isLike: false),
  NewVideoAndStoryOrPostMix(
      isVideo: false, url: '${AssetPath.poster}1 (4).jpg',isLike: false),
];

final AdvancedDrawerController advancedDrawerController =
    AdvancedDrawerController();





// import 'dart:developer';
//
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
//
// enum DynamicRoutes {
//   task,
//   project,
//   lead
// }
//
// class DynamicLinkService {
//   static const String _urlPrefix = 'https://melesbs.page.link';
//   // android configurations
//   static const String _googlePlayLink = "";
//   static const String _androidPackageName = "com.melesbs.crm";
//
//   // ios configurations
//   static const String _iosBundleId = "com.melesbs.crm";
//   static const String _appStoreId = "";
//
//   static final FirebaseDynamicLinks _dynamicLinks = FirebaseDynamicLinks.instance;
//
//   static Future<bool> init() async {
//     final PendingDynamicLinkData? data = await _dynamicLinks.getInitialLink();
//     FirebaseDynamicLinks.instance.onLink.listen((dynamicLink) {})
//         .onError((error) {log('Link Failed: ${error.message}');});
//     return data!=null;
//   }
//
//   static Future<String> createDeepLink({required DynamicRoutes dynamicRoutes, Map? data,SocialMetaTagParameters? socialMetaTagParameters}) async {
//     switch (dynamicRoutes) {
//       case DynamicRoutes.task: return await TaskDeepLink().createShareLink(data,socialMetaTagParameters);
//       case DynamicRoutes.project: return await ProjectDeepLink().createShareLink(data,socialMetaTagParameters);
//       case DynamicRoutes.lead: return await LeadDeepLink().createShareLink(data,socialMetaTagParameters);
//     }
//   }
//
//   static Future<String> _createShareLink({required String link,SocialMetaTagParameters? socialMetaTagParameters}) async {
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: _urlPrefix,
//       link: Uri.parse('$_urlPrefix$link'),
//       androidParameters: AndroidParameters(
//         packageName: _androidPackageName,
//         fallbackUrl: Uri.parse(_googlePlayLink),
//       ),
//       iosParameters: const IOSParameters(
//         bundleId: _iosBundleId,
//         appStoreId: _appStoreId,
//       ),
//       socialMetaTagParameters: socialMetaTagParameters,
//     );
//     final ShortDynamicLink shortLink = await _dynamicLinks.buildShortLink(parameters);
//     return shortLink.shortUrl.toString();
//   }
// }
//
// abstract class DynamicDeepLinkInterface {
//   Future<String> createShareLink(Map? data,SocialMetaTagParameters? socialMetaTagParameters);
// }
//
// class TaskDeepLink implements DynamicDeepLinkInterface {
//   @override
//   Future<String> createShareLink(Map? data,SocialMetaTagParameters? socialMetaTagParameters) async {
//     return await DynamicLinkService._createShareLink(
//       link: "${TaskDetailsScreen.routeNameOnly}/${data?["id"]}",
//       socialMetaTagParameters: socialMetaTagParameters
//     );
//   }
// }
//
// class ProjectDeepLink implements DynamicDeepLinkInterface {
//   @override
//   Future<String> createShareLink(Map? data,SocialMetaTagParameters? socialMetaTagParameters) async {
//     return await DynamicLinkService._createShareLink(
//         link: "${ProjectDetailsScreen.routeNameOnly}/${data?["id"]}",
//         socialMetaTagParameters: socialMetaTagParameters
//     );
//   }
// }
//
// class LeadDeepLink implements DynamicDeepLinkInterface {
//   @override
//   Future<String> createShareLink(Map? data,SocialMetaTagParameters? socialMetaTagParameters) async {
//     return await DynamicLinkService._createShareLink(
//         link: "${LeadDetailsScreen.routeNameOnly}/${data?["id"]}",
//         socialMetaTagParameters: socialMetaTagParameters
//     );
//   }
// }

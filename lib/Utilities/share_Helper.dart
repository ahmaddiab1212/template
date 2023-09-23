
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
//
// import 'package:share_plus/share_plus.dart';
//
// import 'dynamic_link_service.dart';
//
// class ShareHelper{
//
//   static Future shareTask({required TaskModel task})async{
//     String shareUrl = await DynamicLinkService.createDeepLink(
//       dynamicRoutes: DynamicRoutes.task,
//       data: {"id": task.id,},
//       socialMetaTagParameters: SocialMetaTagParameters(
//         title: task.heading,
//         description: task.status,
//       )
//     );
//     if(shareUrl!="") await Share.share(shareUrl, subject: task.heading??"empty task heading");
//   }
//
//
//   static Future shareProject({required ProjectModel project})async{
//     String shareUrl = await DynamicLinkService.createDeepLink(
//         dynamicRoutes: DynamicRoutes.project,
//         data: {"id": project.id,},
//         socialMetaTagParameters: SocialMetaTagParameters(
//             title: project.projectName,
//             description: project.notes,
//         )
//     );
//     if(shareUrl!="") await Share.share(shareUrl, subject: project.projectName??"empty project name");
//   }
//
//   static Future shareLead({required LeadModel lead})async{
//     String shareUrl = await DynamicLinkService.createDeepLink(
//         dynamicRoutes: DynamicRoutes.lead,
//         data: {"id": lead.id,},
//         socialMetaTagParameters: SocialMetaTagParameters(
//             title: lead.clientName,
//             description: lead.leadInformation?.feedback??lead.leadInformation?.cartNum??lead.companyName,
//         )
//     );
//     if(shareUrl!="") await Share.share(shareUrl, subject: lead.clientName??"empty project name");
//   }
// }
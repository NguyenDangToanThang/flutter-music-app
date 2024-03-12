import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music/bloc/album_bloc/album_bloc.dart';
import 'package:music/bloc/album_bloc/album_event.dart';
import 'package:music/utils/utils.dart';
import 'package:music/view/all_music/all_music.dart';
import 'package:music/view/all_music/components/folders_list.dart';
import 'package:music/view/all_music/components/song_list.dart';
import 'package:music/view/common_widget/custom_search_delegate.dart';

import '../../res/app_svg.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.preIcon, this.postIcon});
  final String? title;
  final Widget? preIcon;
  final Widget? postIcon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Stack(

        children: [
          Positioned(left: 1, child: preIcon?? SvgPicture.asset(AppSvg.drawer, height: 20),),

           Center(child: Text(title?? Utils.getGreetingMessage(),style: const TextStyle(
               fontWeight: FontWeight.bold,color: Colors.black87
           ),),),

         Positioned(right: 1, child:  postIcon?? Row(
           children: [
             GestureDetector(
               onTap: () {
                 showSearch(
                   context: context,
                   delegate: CustomSearchDelegate(),
                 );
               },
               child: SvgPicture.asset(
                 AppSvg.search,
                 color: Colors.black87,
                 width: 20,
               ),
             ),
             const SizedBox(
               width: 10,
             ),
             SvgPicture.asset(
               AppSvg.notification,
               color: Colors.black87,
               width: 20,
             ),
           ],
         ),)
        ],
      ),
    );
  }
}
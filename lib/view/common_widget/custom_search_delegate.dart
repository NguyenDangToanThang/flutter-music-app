import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/album_bloc/album_bloc.dart';
import 'package:music/bloc/album_bloc/album_event.dart';
import 'package:music/view/all_music/components/folders_list.dart';
import 'package:music/view/all_music/components/song_list.dart';

class CustomSearchDelegate extends SearchDelegate{

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon:const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<AlbumBloc>().add(GetFolderEvent());
    return WillPopScope(
      onWillPop: ()async{
        if(context.read<AlbumBloc>().currentPage==0){
          return true;
        }else{
          context.read<AlbumBloc>().add(BackArrowTap(context: context));
          return false;
        }
      }, child: Expanded(child: PageView(
      controller: context
          .read<AlbumBloc>()
          .pageController,
      physics: const NeverScrollableScrollPhysics(),
      children:  [
        FolderList(name: query,),
        SongList(name: query),
      ],
    )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<AlbumBloc>().add(GetFolderEvent());
    return WillPopScope(
      onWillPop: ()async{
        if(context.read<AlbumBloc>().currentPage==0){
          return true;
        }else{
          context.read<AlbumBloc>().add(BackArrowTap(context: context));
          return false;
        }
      }, child: Expanded(child: PageView(
      controller: context
          .read<AlbumBloc>()
          .pageController,
      physics: const NeverScrollableScrollPhysics(),
      children:  [
        FolderList(name: query,),
        SongList(name: query),
      ],
    )),
    );
  }
}
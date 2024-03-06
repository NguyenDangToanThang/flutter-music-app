import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:layout_pro/responsive_layout.dart';
import 'package:music/view/all_music/components/folders_list.dart';
import 'package:music/view/all_music/components/song_list.dart';
import 'package:music/view/home/components/song_list_home.dart';

import '../../../bloc/album_bloc/album_bloc.dart';
import '../../../bloc/album_bloc/album_event.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_svg.dart';
import '../../../utils/utils.dart';
import '../../all_music/all_music.dart';

class RecentlyPage extends StatefulWidget {
  const RecentlyPage({super.key});

  @override
  State<RecentlyPage> createState() => _RecentlyPageState();
}

class _RecentlyPageState extends State<RecentlyPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Recently List',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.announcement)),
          ],
          bottom: const TabBar(tabs: [
            Tab(text: 'Songs'),
            Tab(text: 'Albums')
          ]),
        ),
        body: const TabBarView(
          children: [
            // Trang con cho tab 'Songs'
            SongList(),

            // Trang con cho tab 'Albums'
            FolderList(),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_pro/responsive_layout.dart';
import 'package:music/bloc/album_bloc/album_bloc.dart';
import 'package:music/bloc/home_bloc/home_state.dart';
import 'package:music/utils/utils.dart';
import 'package:music/view/common_widget/loading_files.dart';
import 'package:music/view/home/components/song_widget.dart';

import '../../../bloc/album_bloc/album_state.dart';
import '../../../bloc/player_bloc/player_bloc.dart';
import '../../../res/app_colors.dart';
import '../../player/player.dart';

class SongList extends StatelessWidget {
  final String name;
  const SongList({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      buildWhen: (previous, current) =>
      previous.fileStatus != current.fileStatus ||
          previous.audioFiles != current.audioFiles,
      builder: (context, state) {
        if (state.fileStatus == Status.complete) {
          final searchItems = state.audioFiles
              .where((file) =>
              file.name.toString().toLowerCase().contains(name.toLowerCase()))
              .toList();
          if (searchItems.isEmpty) {
            return const Center(
              child: Text(
                'No song found with your suggestion',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ResponsiveLayout(
            mobileCrossAxisCount: 1,
            mobileRatio: 4.4,
            largeMobileCrossAxisCount: 1,
            largeMobileRatio: 5.8,
            tabletCrossAxisCount: 3,
            tabletRatio: 4,
            largeTabletCrossAxisCount: 4,
            largeTabletRatio: 4,
            desktopRatio: 4,
            desktopScreenCrossAxisCount: 4,
            builder: (context, index) {
              final String image = Utils.getRandomImage();
              final file = searchItems[index];

              return Padding(
                padding: !ResponsiveLayout.isLargeMobile(context)
                    ? const EdgeInsets.only(top: 10, right: 20, left: 20)
                    : const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    context.read<PlayerBloc>().add(OnPlayEvent(file: file));
                    Utils.go(
                      context: context,
                      screen: Player(file: file, image: image),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor,
                          offset: const Offset(8, 6),
                          blurRadius: 12,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-8, -6),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: SongWidget(
                      image: image,
                      name: file.name.toString(),
                      length: file.length.toString(),
                      file: file,
                    ),
                  ),
                ),
              );
            },
            itemCount: searchItems.length,
          );
        } else {
          return const FilesLoading();
        }
      },
    );
  }
}

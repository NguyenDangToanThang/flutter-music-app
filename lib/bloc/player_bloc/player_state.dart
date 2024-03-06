part of 'player_bloc.dart';

enum SongStatus { playing, pause, stopped }

class PlayerState extends Equatable {
  final bool isPlaying;
  final double progress;
  final bool isFavourite;
  final AudioFile? file;
  final SongStatus status;
  final bool isLoop;

  const PlayerState(
      {this.isPlaying = true,
      this.isFavourite = false,
      this.progress = 0.0,
      this.status = SongStatus.stopped,
      this.file,
      this.isLoop = true});

  PlayerState copyWith(
      {bool? isPlaying,
      double? progress,
      bool? isFavourite,
      SongStatus? status,
      AudioFile? file,
      bool? isLoop}) {
    return PlayerState(
        isFavourite: isFavourite ?? this.isFavourite,
        isPlaying: isPlaying ?? this.isPlaying,
        progress: progress ?? this.progress,
        status: status ?? this.status,
        file: file ?? this.file,
        isLoop: isLoop ?? this.isLoop
    );
  }

  @override
  List<Object> get props =>
      [isPlaying, progress, isFavourite, status, file ?? '',isLoop];
}

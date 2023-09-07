import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    Key? key, // Added the correct syntax for declaring a named parameter
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, snapshot) {
            // Ensure that snapshot data is not null before accessing it
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            final sequenceState = snapshot.data!;
            final currentIndex = sequenceState.currentIndex;

            return IconButton(
              onPressed: audioPlayer.hasPrevious
                  ? () => audioPlayer.seek(Duration.zero, index: currentIndex - 1)
                  : null,
              iconSize: 45,
              icon: const Icon(Icons.skip_previous, color: Colors.white),
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            final playerState = snapshot.data!;
            final processingState = playerState.processingState;

            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                width: 64.0,
                height: 64.0,
                margin: const EdgeInsets.all(10.0),
                child: const CircularProgressIndicator(),
              );
            } else if (!audioPlayer.playing) {
              return IconButton(
                onPressed: audioPlayer.play,
                iconSize: 75.0,
                icon: const Icon(Icons.play_circle, color: Colors.white),
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.pause_circle, color: Colors.white),
                iconSize: 75.0,
                onPressed: audioPlayer.pause,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.replay_circle_filled_outlined, color: Colors.white),
                iconSize: 75.0,
                onPressed: () => audioPlayer.seek(Duration.zero, index: 0),
              );
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            final sequenceState = snapshot.data!;
            final currentIndex = sequenceState.currentIndex;

            return IconButton(
              onPressed: audioPlayer.hasNext
                  ? () => audioPlayer.seek(Duration.zero, index: currentIndex + 1)
                  : null,
              iconSize: 45,
              icon: const Icon(Icons.skip_next, color: Colors.white),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_app1/models/playlist_model.dart';
import 'package:music_app1/widgets/widgets.dart';

import '../models/song_model.dart';
import '../widgets/section_header.dart';
import '../widgets/song_card.dart';
import '../models/playlist_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlist = Playlist.playlists;


    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8),
            ],
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: _CustomNavBar(),
        body: SingleChildScrollView(child: Column(
          children: [
            const _DiscoverMusic(),
            _TrendingMusic(songs: songs),
            _PlaylistMusic(playlist: playlist),
          ],
        ),),
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    super.key,
    required this.playlist,
  });

  final List<Playlist> playlist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'PlayLists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlist.length,
            itemBuilder: ((context, index) {
              return PlaylistCard(playlist: playlist[index]);
          })),
        ],
      ),
    );
  }
}




class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.only(right: 20.0,),
            child: SectionHeader(title: 'Trending Music'),
          ),
          const SizedBox(height: 20,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.27, child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: songs.length,
            itemBuilder: (context, index) {
              return SongCard(song: songs[index]);
            }),
          ),
        ],
      ),
    );
  }
}



class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome',
          style: Theme.of(context)
          .textTheme
          .bodyLarge
          ),
          const SizedBox(height: 5,),
           Text('Enjoy your favorite music',
          style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.grey.shade400),

              prefixIcon: 
              Icon(Icons.search, color: Colors.grey.shade400),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
              ),

            ),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline), label: 'Play'),
        BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: 'Profile'),
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1602233158242-3ba0ac4d2167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=436&q=80'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

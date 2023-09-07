import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title, 
    required this.songs, 
    required this.imageUrl
    });

    static List<Playlist> playlists = [
      Playlist(
        title: 'Hip-hop R&B Mix',
        songs: Song.songs,
        imageUrl: "https://images.unsplash.com/photo-1520454125516-134a66d9bf78?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8TXVzaWMlMjBzb25nfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",

      ),
      Playlist(
        title: 'Rock & Roll',
        songs: Song.songs,
        imageUrl: "https://media.istockphoto.com/id/1417752495/photo/african-man-singing-and-gesturing-with-his-hands.webp?b=1&s=170667a&w=0&k=20&c=HWLzh7wseCnWXTGpdE4p4E5fCjneamImF01WcjD7eBs=",

      ),
      Playlist(
        title: 'Techno',
        songs: Song.songs,
        imageUrl: "https://media.istockphoto.com/id/1451748520/photo/playback-singer-recording-album-in-the-studio.jpg?s=612x612&w=0&k=20&c=e98kCZHJBq0rKM9rHltEAquY_tX6aLQaoCwS8Z_F6EQ=",

      ),

    ];
}
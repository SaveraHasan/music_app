class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title, 
    required this.description, 
    required this.url, 
    required this.coverUrl
}); 

  static List<Song> songs = [
    Song(title: 'Stereo', description: 'Stereo', url: 'assets/music/Stario.mp3', coverUrl: 'assets/images/1.jpg'),
    Song(title: 'Stereo', description: 'Stereo', url: 'assets/music/Stario.mp3', coverUrl: 'assets/images/2.jpg'),
    Song(title: 'Stereo', description: 'Stereo', url: 'assets/music/Stario.mp3', coverUrl: 'assets/images/3.jpg'),
  ];

}
import 'package:flutter/material.dart';
import 'package:search_system/movie_model.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MovieModel> movieList = [
    MovieModel(
      movieTitle: 'Manifest',
      movieRating: 8.0,
      movieUrl:
          'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg',
      movieYear: 2021,
    ),
    MovieModel(
      movieTitle: 'Black Adam',
      movieRating: 8.0,
      movieUrl:
          'https://www.indiewire.com/wp-content/uploads/2019/12/us-1.jpg?w=758',
      movieYear: 2022,
    ),
    MovieModel(
      movieTitle: 'YOU',
      movieRating: 7.5,
      movieUrl:
          'https://www.indiewire.com/wp-content/uploads/2019/12/us-1.jpg?w=758',
      movieYear: 2020,
    ),
    MovieModel(
      movieTitle: 'Willow',
      movieRating: 6.5,
      movieUrl:
          'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg',
      movieYear: 2017,
    ),
    MovieModel(
      movieTitle: 'Magnify',
      movieRating: 8.0,
      movieUrl:
          'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg',
      movieYear: 2021,
    ),
    MovieModel(
      movieTitle: 'Blood',
      movieRating: 8.0,
      movieUrl:
          'https://www.indiewire.com/wp-content/uploads/2019/12/us-1.jpg?w=758',
      movieYear: 2022,
    ),
    MovieModel(
      movieTitle: 'Yestier',
      movieRating: 7.5,
      movieUrl:
          'https://www.indiewire.com/wp-content/uploads/2019/12/us-1.jpg?w=758',
      movieYear: 2020,
    ),
    MovieModel(
      movieTitle: 'William',
      movieRating: 6.5,
      movieUrl:
          'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg',
      movieYear: 2017,
    ),
    MovieModel(
      movieTitle: 'Menify',
      movieRating: 8.0,
      movieUrl:
          'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg',
      movieYear: 2021,
    ),
    MovieModel(
      movieTitle: 'Blink',
      movieRating: 8.0,
      movieUrl:
          'https://www.indiewire.com/wp-content/uploads/2019/12/us-1.jpg?w=758',
      movieYear: 2022,
    ),
    MovieModel(
      movieTitle: 'YOUTH',
      movieRating: 7.5,
      movieUrl:
          'https://www.indiewire.com/wp-content/uploads/2019/12/us-1.jpg?w=758',
      movieYear: 2020,
    ),
    MovieModel(
      movieTitle: 'Window',
      movieRating: 6.5,
      movieUrl:
          'https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/black-panther-web.jpg',
      movieYear: 2017,
    ),
  ];

  List<MovieModel> filteredMovieList = List.from(movieList);

  void searchAndUpdateFilteredList(String searchTerm) {
    setState(() {
      filteredMovieList = movieList
          .where((e) =>
              e.movieTitle!.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search for a movie',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => searchAndUpdateFilteredList(value),
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  // borderSide: BorderSide.none,
                ),
                hintText: 'e.g. Spiderman...',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredMovieList.isEmpty
                  ? const Center(
                    child: Text(
                        'No result found',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  )
                  : ListView.builder(
                      itemCount: filteredMovieList.length,
                      itemBuilder: (_, i) => ListTile(
                        title: Text(
                          filteredMovieList[i].movieTitle!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${filteredMovieList[i].movieYear!}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          '${filteredMovieList[i].movieRating!}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        leading: Image.network(
                          filteredMovieList[i].movieUrl!,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

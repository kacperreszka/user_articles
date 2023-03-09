import 'package:dio/dio.dart';

class AuthorsMockedDataSource {
  Future<List<Map<String, dynamic>>?> getAuthors() async {
    return [
      {
        'id': 1,
        'picture': 'https://randomuser.me/api/portraits/men/57.jpg',
        'first_name': 'Piotr',
        'last_name': 'Obdarowicz',
      },
      {
        'id': 2,
        'picture': 'https://randomuser.me/api/portraits/men/58.jpg',
        'first_name': 'Radosław',
        'last_name': 'Gdański',
      },
    ];
  }
}

class AuthorRemoteDioDataSource { //Pobieranie danych z Dio
   Future<List<Map<String, dynamic>>?> getAuthors() async {
    final response = await Dio().get<List<dynamic>>('https://my-json-server.typicode.com/adamsmaka/json-demo/users');
    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
   }

}

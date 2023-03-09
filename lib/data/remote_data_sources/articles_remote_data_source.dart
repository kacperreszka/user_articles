import 'package:dio/dio.dart';

class ArticlesMockedDataSource {
  Future<List<Map<String, dynamic>>?> getArticles() async {
    return [
      {
        'id': 1,
        'author_id': 1,
        'content':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      },
      {
        'id': 2,
        'author_id': 1,
        'content':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      },
    ];
  }
}

class ArticlesRemoteDioDataSource { //Pobieranie danych z Dio
  Future<List<Map<String, dynamic>>?> getArticles() async {
    final response = await Dio().get<List<dynamic>>('https://my-json-server.typicode.com/adamsmaka/json-demo/articles');
    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((articles) => articles as Map<String, dynamic>).toList();
  }
}

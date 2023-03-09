import 'package:user_articles/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:user_articles/domain/models/article_model.dart';

class ArticlesRepository {
  ArticlesRepository({required this.remoteDataSource});

  final ArticlesRemoteDioDataSource remoteDataSource;

  Future<List<ArticleModel>> getArticlesForAuthorId(int authorId) async {
    final json = await remoteDataSource.getArticles();
    if (json == null) {
      return [];
    }
    final allArticles = json.map((item) => ArticleModel.fromJson(item)).toList();

    return allArticles.where((article) => article.authorId == authorId).toList();  
    //przypisywanie odpowiednich artykułów do autorów za pomocą id autora ^ article = element
  }
}

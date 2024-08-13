import 'package:projectzeta/data/data.dart';
import 'package:projectzeta/domain/domain.dart';

class AccountService implements LoadAccountByUser {
  final HttpClientProvider httpClientProvider;

  AccountService({required this.httpClientProvider});

  @override
  Future<List<AccountModel>> loadByUser(UserModel userModel, Page page) async {
    var url = page.toUrlPagination(Paths.loadAccountByUser.value);

    var response = await httpClientProvider.get(url);

    if (response.content.isNotEmpty) {
      return response.content
          .map((item) => AccountEntity.fromJSON(json: item).toModel())
          .toList();
    }

    return List.empty();
  }
}

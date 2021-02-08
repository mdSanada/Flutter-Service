import 'package:flutter_service/core/models/person.dart';
import 'package:flutter_service/core/repositories/person.dart';
import 'package:flutter_service/core/service/api_response.dart';
import 'package:mobx/mobx.dart';

part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  PersonRepository _repository = PersonRepository();

  @observable
  bool isLoading = false;

  @observable
  bool onError = false;

  @observable
  Person person;

  @observable
  String search;

  @computed
  bool get isError => (!isLoading && onError);

  @action
  setLoading(bool _isLoading) {
    isLoading = _isLoading;
  }

  @action
  setErrorState() {
    isLoading = false;
    onError = true;
    person = null;
  }

  @action
  changeSearch(String _search) {
    search = _search;
  }

  @action
  setPerson(Person _person) {
    person = _person;
    setLoading(false);
  }

  @action
  Future<ApiResponse<Person>> searchData() async {
    person = null;
    setLoading(true);
    ApiResponse.loading("is loading");
    return _repository.getData(search);
  }
}

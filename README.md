# Flutter-Service

## MVVM
MVVM Architecture based on Swift MVVM Architecture.
Model - (View | ViewController) - ViewModel.

### View Controller
Example of View controller, handling actions sended from View.
```dart
class ViewController {
  final searchController = TextEditingController();
  ViewModel _viewModel;

  ViewController(ViewModel viewModel) {
    _viewModel = homeViewModel;
  }

  setSearchData(String person) {
    _viewModel.changeSearch(person);
  }

  void didLoad() async {
    setSearchData('1');
    await _viewModel.searchData();
    setSearchData('');
  }

  void search() async {
    _viewModel.searchData();
  }
}
```

### ViewModel
```dart
part 'sn.viewmodel.g.dart';

class ViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _ViewModelBase with Store {
  Repository _repository = Repository();

  @observable
  bool onLoading = false;

  @observable
  bool onError = false;

  @observable
  Object object;

  @observable
  String search;

  @computed
  bool get isError => (!onLoading && onError);

  @computed
  bool get isLoading => ((onLoading || (object == null)) && !onError);

  @action
  setLoading(bool _isLoading) {
    onLoading = _isLoading;
  }

  @action
  setErrorState() {
    onLoading = false;
    onError = true;
    object = null;
  }

  @action
  changeSearch(String _search) {
    search = _search;
  }

  @action
  setPerson(Object _object) {
    object = _object;
    setLoading(false);
    getImage();
    onError = false;
  }

  @action
  searchData() async {
    person = null;
    setLoading(true);
    var response = _repository.getData(search);
    await response.subscribe(
      mapper: Object.fromMap,
      onSuccess: (data) {
        setPerson(data);
      },
      onError: (data) {
        print(data);
        setErrorState();
      },
    );
  }
}
```
## Repositories
It provides methods to interact with data sources, such as APIs or databases.
```
class Repository {
  Future<ApiResponse<dynamic>> getData(String model) async {
    var dio = CustomDio.withAuthentication().instance;
    return await dio.get(model + '/').request();
  }
}
```

## Service
The Service layer encapsulates the communication with external services, such as APIs.
Will return a Status representing your API call
```dart
  enum Status { COMPLETED, ERROR }
```
Also add an handler to handle the API Response, and encapsulte in closures as `nSucces(T)`, `onError(Error)`.
In your `Success(T)` closure, the Reponse JSON, will be already mapped to `Model`.
```dart
  Future<void> subscribe<T>(
      {T Function(Map<String, dynamic> data) mapper,
      Function(T data) onSuccess,
      Function(dynamic err) onError}) async {
    try {
      var response = await this;
      final mapped = mapper(response.data);
      return onSuccess(mapped);
    } catch (err) {
      return onError(err.error);
    }
  }
```

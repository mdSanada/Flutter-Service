import 'package:flutter_service/core/models/imagePexels.dart';
import 'package:flutter_service/core/models/person.dart';
import 'package:flutter_service/core/repositories/person.repository.dart';
import 'package:flutter_service/core/service/future_extension.dart';
import 'package:mobx/mobx.dart';

part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  PersonRepository _repository = PersonRepository();

  @observable
  bool onLoading = false;

  @observable
  bool onError = false;

  @observable
  Person person;

  @observable
  String search;

  @observable
  String imageUrl;

  @computed
  bool get isError => (!onLoading && onError);

  @computed
  bool get isLoading =>
      ((onLoading || (person == null) || (imageUrl == null)) && !onError);

  @action
  setLoading(bool _isLoading) {
    onLoading = _isLoading;
  }

  @action
  setErrorState() {
    onLoading = false;
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
    getImage();
    onError = false;
  }

  @action
  setImage(ImagePexels _image) {
    if (_image.photos.length != 0) {
      imageUrl = _image.photos.first.src.original;
    } else {
      imageUrl =
          'https://i.pinimg.com/originals/5a/cf/1b/5acf1b48227707c4e6d63020deba3f23.jpg';
    }
    setLoading(false);
    onError = false;
  }

  @action
  searchData() async {
    person = null;
    imageUrl = null;
    setLoading(true);
    var response = _repository.getData(search);
    await response.subscribe(
      mapper: Person.fromMap,
      onSuccess: (data) {
        setPerson(data);
      },
      onError: (data) {
        print(data);
        setErrorState();
      },
    );
  }

  @action
  getImage() async {
    setLoading(true);
    var response = _repository.getImage(person.name);
    await response.subscribe(
      mapper: ImagePexels.fromMap,
      onSuccess: (data) {
        print(data);
        setImage(data);
      },
      onError: (data) {
        print(data);
        setErrorState();
      },
    );
  }
}

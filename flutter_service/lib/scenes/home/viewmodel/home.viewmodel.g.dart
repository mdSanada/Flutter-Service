// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  Computed<bool> _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??= Computed<bool>(() => super.isError,
          name: '_HomeViewModelBase.isError'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeViewModelBase.isLoading'))
          .value;

  final _$onLoadingAtom = Atom(name: '_HomeViewModelBase.onLoading');

  @override
  bool get onLoading {
    _$onLoadingAtom.reportRead();
    return super.onLoading;
  }

  @override
  set onLoading(bool value) {
    _$onLoadingAtom.reportWrite(value, super.onLoading, () {
      super.onLoading = value;
    });
  }

  final _$onErrorAtom = Atom(name: '_HomeViewModelBase.onError');

  @override
  bool get onError {
    _$onErrorAtom.reportRead();
    return super.onError;
  }

  @override
  set onError(bool value) {
    _$onErrorAtom.reportWrite(value, super.onError, () {
      super.onError = value;
    });
  }

  final _$personAtom = Atom(name: '_HomeViewModelBase.person');

  @override
  Person get person {
    _$personAtom.reportRead();
    return super.person;
  }

  @override
  set person(Person value) {
    _$personAtom.reportWrite(value, super.person, () {
      super.person = value;
    });
  }

  final _$searchAtom = Atom(name: '_HomeViewModelBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$imageUrlAtom = Atom(name: '_HomeViewModelBase.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  final _$searchDataAsyncAction = AsyncAction('_HomeViewModelBase.searchData');

  @override
  Future searchData() {
    return _$searchDataAsyncAction.run(() => super.searchData());
  }

  final _$getImageAsyncAction = AsyncAction('_HomeViewModelBase.getImage');

  @override
  Future getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  dynamic setLoading(bool _isLoading) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setLoading');
    try {
      return super.setLoading(_isLoading);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorState() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setErrorState');
    try {
      return super.setErrorState();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSearch(String _search) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeSearch');
    try {
      return super.changeSearch(_search);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPerson(Person _person) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setPerson');
    try {
      return super.setPerson(_person);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImage(ImagePexels _image) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setImage');
    try {
      return super.setImage(_image);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onLoading: ${onLoading},
onError: ${onError},
person: ${person},
search: ${search},
imageUrl: ${imageUrl},
isError: ${isError},
isLoading: ${isLoading}
    ''';
  }
}

import 'package:challengeinstabuy/models/BannerResult.dart';
import 'package:challengeinstabuy/services/data/instaBuyService.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  InstaBuyService _service = InstaBuyService();

  final _searchController = BehaviorSubject<String>();
  Observable<String> get searchFlux => _searchController.stream;
  Sink<String> get searchEvent => _searchController.sink;

  Observable<BannerResult> apiResultFlux;

  SearchBloc() {
    apiResultFlux = searchFlux
        .distinct()
        .where((value) => value.length > 2)
        .debounce(Duration(microseconds: 500))
        .asyncMap(_service.search)
        .switchMap((value) => Observable.just(value));
  }

  void dispose() {
    _searchController.close();
  }
}

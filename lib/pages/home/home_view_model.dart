import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:region_search_app/data/model/location.dart';
import 'package:region_search_app/data/repository/location_repository.dart';

class HomeState {
  HomeState({required this.locations});
  List<Location>? locations;
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(locations: []);
  }

  Future<void> searchLocations(String query) async {
    final locationRepository = LocationRepository();
    state = HomeState(locations: await locationRepository.search(query));
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});

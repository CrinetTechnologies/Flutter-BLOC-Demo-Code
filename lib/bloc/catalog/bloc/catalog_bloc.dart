import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_demo_code/bloc/catalog/catalog.dart';
import 'package:bloc_demo_code/bloc/shopping_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({required this.shoppingRepository}) : super(CatalogLoading()) {
    on<CatalogStarted>(_onStarted);
  }

  final ShoppingRepository shoppingRepository;

  Future<void> _onStarted(
    CatalogStarted event,
    Emitter<CatalogState> emit,
  ) async {
    emit(CatalogLoading());
    try {
      final catalog = await shoppingRepository.loadCatalog();
      emit(CatalogLoaded(Catalog(itemNames: catalog)));
    } catch (_) {
      emit(CatalogError());
    }
  }
}

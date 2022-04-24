import 'package:bloc/bloc.dart';

import '../user.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void loadWithoutError() async {
    emit(HomeLoading(state.users));
    await Future.delayed(const Duration(seconds: 2));
    final _users = [
      User('User name 1',
          'https://i.picsum.photos/id/10/200/200.jpg?hmac=Pal2P4G4LRZVjNnjESvYwti2SuEi-LJQqUKkQUoZq_g'),
      User('User name 2',
          'https://i.picsum.photos/id/25/200/200.jpg?hmac=G4ZRBi0qdWfQJQs_yxNQr_LJJlf0V1_Pdj8Tp41xsJU'),
      User('User name 3',
          'https://i.picsum.photos/id/944/200/200.jpg?hmac=1Hdj8yjDsg6pbmgsiAGRdUQ8MA4hfi4uapepYyrMaGU'),
      User('User name 4',
          'https://i.picsum.photos/id/989/200/200.jpg?hmac=YmaagsSArKDGDSeyRJ9aYRxKM6KdP49ZGYtyhLHlCcY'),
      User('User name 5',
          'https://i.picsum.photos/id/641/200/200.jpg?hmac=9pd71nRRRsT7TXf0zn0hQ6tW6VQnQ-UtL1JXDhJZB8E'),
    ];
    emit(HomeLoaded(_users));
  }

  void loadWithError() async {
    emit(HomeLoading(state.users));
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeError(state.users, 'Unknown error'));
  }
}

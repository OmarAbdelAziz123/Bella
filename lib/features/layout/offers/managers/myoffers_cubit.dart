import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'myoffers_state.dart';

class MyoffersCubit extends Cubit<MyoffersState> {
  MyoffersCubit() : super(MyoffersInitial());
}

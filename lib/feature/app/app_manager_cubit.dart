import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit() : super(AppManagerInitial());

}

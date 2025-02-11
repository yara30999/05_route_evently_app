import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit() : super(CreateEventInitial());
}

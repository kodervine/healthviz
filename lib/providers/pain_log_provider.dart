import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/models/pain_log.dart';

// PainLogProvider that manages the list of pain logs
final painLogProvider =
    StateNotifierProvider<PainLogNotifier, List<PainLog>>((ref) {
  return PainLogNotifier();
});

class PainLogNotifier extends StateNotifier<List<PainLog>> {
  PainLogNotifier() : super([]);

  void addPainLog(PainLog log) {
    state = [...state, log];
  }
}

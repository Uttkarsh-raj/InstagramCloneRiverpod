import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/state/auth/models/auth_result.dart';
import 'package:instagram_clone/state/auth/providers/auth_state_provider.dart';

final isLoggedIn = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});

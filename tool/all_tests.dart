import '../test/chain/chain_test.dart' as chain_chain_test;
import '../test/chain/dart2js_test.dart' as chain_dart2js_test;
import '../test/chain/vm_test.dart' as chain_vm_test;
import '../test/frame_test.dart' as frame_test;
import '../test/trace_test.dart' as trace_test;
import '../test/vm_test.dart' as vm_test;

void main() {
  chain_chain_test.main();
  chain_dart2js_test.main();
  chain_vm_test.main();
  frame_test.main();
  trace_test.main();
  vm_test.main();
}
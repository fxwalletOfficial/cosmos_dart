import 'dart:typed_data';

import 'package:cosmos_dart/cosmos_dart.dart';

/// [TxEncoder] marshals a transaction to bytes
typedef TxEncoder = Uint8List Function(Tx tx);

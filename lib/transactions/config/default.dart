import 'package:cosmos_dart/cosmos_dart.dart';

/// [DefaultTxConfig] represents the default [TxConfig] implementation.
class DefaultTxConfig extends TxConfig {
  DefaultTxConfig._();

  factory DefaultTxConfig.create() {
    return DefaultTxConfig._();
  }

  @override
  TxEncoder txEncoder() {
    return defaultEncoder();
  }

  @override
  SignMode defaultSignMode() {
    return SignMode.SIGN_MODE_DIRECT;
  }

  @override
  TxBuilder newTxBuilder() {
    return TxBuilder.create();
  }

  @override
  SignModeHandler signModeHandler() {
    return DirectSignModeHandler.create();
  }
}

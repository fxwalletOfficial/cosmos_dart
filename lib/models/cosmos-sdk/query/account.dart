import 'package:alan/models/export.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'account.g.dart';

/// Contains the data that is returned from a full node when querying
/// for the /auth/accounts/{address} REST API endpoint.
@immutable
@JsonSerializable(explicitToJson: true)
class CosmosAccount extends Equatable {
  /// Address associated to the the account, is Bech32 format.
  /// If the user does not exist on-chain, this will be an empty string.
  @JsonKey(name: "address", nullable: false, defaultValue: "")
  final String address;

  /// Account number on-chain.
  /// If the account does not exist on-chain this will be -1.
  @JsonKey(name: "account_number", nullable: false, defaultValue: -1)
  final int accountNumber;

  /// Account sequence on-chain.
  /// If the account does not exist on-chain this will be -1.
  @JsonKey(name: "sequence", nullable: false, defaultValue: -1)
  final int sequence;

  /// Coins associated to this account.
  /// If the account does not exist on-chain, this will be an empty array.
  @JsonKey(name: "coins", nullable: false, defaultValue: [])
  final List<StdCoin> coins;

  const CosmosAccount({
    @required this.address,
    @required this.accountNumber,
    @required this.sequence,
    @required this.coins,
  })  : assert(address != null),
        assert(accountNumber != null),
        assert(sequence != null),
        assert(coins != null);

  /// Allows to easily create a local account having everything set as
  /// the default not on-chain values a part from the given [address].
  factory CosmosAccount.offline(String address) {
    return CosmosAccount(
      address: address,
      accountNumber: -1,
      sequence: -1,
      coins: [],
    );
  }

  /// Builds a [CosmosAccount] instance by parsing the given [json] map.
  factory CosmosAccount.fromJson(Map<String, dynamic> json) {
    return _$CosmosAccountFromJson(json);
  }

  /// Transforms this instance of [CosmosAccount] into a JSON map.
  Map<String, dynamic> toJson() {
    return _$CosmosAccountToJson(this);
  }

  /// Allows to create a copy instance of this [CosmosAccount] containing the
  /// same exact data, with the ones given replaced.
  CosmosAccount copyWith({
    String address,
    int accountNumber,
    int sequence,
    List<StdCoin> coins,
  }) {
    return CosmosAccount(
      address: address ?? this.address,
      accountNumber: accountNumber ?? this.accountNumber,
      sequence: sequence ?? this.sequence,
      coins: coins ?? this.coins,
    );
  }

  @override
  List<Object> get props {
    return [address, accountNumber, sequence, coins];
  }

  @override
  String toString() {
    return 'AccountData { '
        'address: $address, '
        'accountNumber: $accountNumber, '
        'sequence: $sequence, '
        'coins: $coins '
        '}';
  }
}

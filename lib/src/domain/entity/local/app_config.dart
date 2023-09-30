import 'package:equatable/equatable.dart';

class AppConfig extends Equatable {
  factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
        host: json['HOST'] as String,
        socketHost: json['SOCKET_HOST'] as String,
        headersType: json['HEADERS'] as String,
      );

  const AppConfig({
    required this.host,
    required this.socketHost,
    required this.headersType,
  });

  final String host;
  final String socketHost;
  final String headersType;

  @override
  List<Object?> get props => [host, socketHost, headersType];

  @override
  String toString() =>
      'AppConfig(host : $host , socketHost : $socketHost , headersType : $headersType)';
}

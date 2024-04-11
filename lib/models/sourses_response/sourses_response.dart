import 'source.dart';

class SoursesResponse {
  String? status;
  List<Source>? sources;

  SoursesResponse({this.status, this.sources});
  @override
  String toString() => 'SourcesResponse(status:$status, sources:$sources)';

  factory SoursesResponse.fromJson(Map<String, dynamic> json) {
    return SoursesResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };
}

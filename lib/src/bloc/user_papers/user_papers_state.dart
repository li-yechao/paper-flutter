part of 'user_papers_bloc.dart';

class UserPapersState extends Equatable {
  final RequestStatus? status;
  final dynamic error;
  final List<Edge<Paper>> edges;
  final int? total;
  final OrderBy<PaperOrderField> orderBy;

  UserPapersState({
    this.status,
    this.error,
    this.edges = const [],
    this.total,
    this.orderBy = const OrderBy(
      field: PaperOrderField.ID,
      direction: OrderDirection.ASC,
    ),
  });

  UserPapersState copyWith({
    RequestStatus? status,
    dynamic error,
    List<Edge<Paper>>? edges,
    int? total,
  }) {
    return UserPapersState(
      status: status ?? this.status,
      error: error ?? this.error,
      edges: edges ?? this.edges,
      total: total ?? this.total,
      orderBy: this.orderBy,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        edges,
        total,
        orderBy,
      ];
}

enum PaperOrderField { ID, UPDATED_AT }

class Paper {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String? title;
  final List<String>? tags;
  final bool canViewerWritePaper;
  final PaperToken? token;

  final User user;

  Paper({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.title,
    this.tags,
    required this.canViewerWritePaper,
    required this.user,
    this.token,
  });

  factory Paper.fromJson({
    required Map<String, dynamic> json,
    required User user,
    PaperToken? token,
  }) {
    return Paper(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      title: json['title'],
      tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
      canViewerWritePaper: json['canViewerWritePaper'],
      user: user,
      token: token,
    );
  }

  Paper copyWith({
    String? updatedAt,
    String? title,
    List<String>? tags,
  }) {
    return Paper(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      tags: tags ?? this.tags,
      canViewerWritePaper: canViewerWritePaper,
      user: user,
    );
  }
}

class PaperToken {
  final String accessToken;

  PaperToken({
    required this.accessToken,
  });

  factory PaperToken.fromJson({
    required Map<String, dynamic> json,
  }) {
    return PaperToken(
      accessToken: json['accessToken'],
    );
  }
}

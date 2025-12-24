class Link {
  dynamic url;
  String? label;
  dynamic page;
  bool? active;

  Link({this.url, this.label, this.page, this.active});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json['url'] as dynamic,
        label: json['label'] as String?,
        page: json['page'] as dynamic,
        active: json['active'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'label': label,
        'page': page,
        'active': active,
      };
}

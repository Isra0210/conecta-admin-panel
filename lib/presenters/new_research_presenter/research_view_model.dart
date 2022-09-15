import 'package:equatable/equatable.dart';

class ResearchViewModel extends Equatable {
  const ResearchViewModel({
    required this.title,
    required this.type,
    required this.options,
  });

  final String type;
  final String title;
  final List<String> options;

  @override
  List<Object> get props => [title, type, options];

  factory ResearchViewModel.fromJson(Map<String, dynamic> json) {
    return ResearchViewModel(
      title: json['title'],
      type: json['type'],
      options: json['options'],
    );
  }

  @override
  String toString() {
    return "title: $title type: $type options: $options";
  }
}

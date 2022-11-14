// ignore_for_file: sort_constructors_first

part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.theme = ThemeMode.system,
    this.settingsValue,
  });

  // enum
  final ThemeMode theme;
  final ThemeMode? settingsValue;

  @override
  List<Object?> get props => [theme, settingsValue];

  ThemeState copyWith({
    ThemeMode? theme,
    ThemeMode? settingsValue,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      settingsValue: settingsValue ?? this.settingsValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'theme': theme.index,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      theme: ThemeMode.values[map['theme'] as int],
    );
  }
}

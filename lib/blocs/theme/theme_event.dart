part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {}

class ThemeTileChanged extends ThemeEvent {
  const ThemeTileChanged(this.settingsValue);

  final ThemeMode settingsValue;

  @override
  List<Object> get props => [settingsValue];
}

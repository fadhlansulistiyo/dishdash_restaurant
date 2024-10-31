import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4286142720),
      surfaceTint: Color(4286142720),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294425108),
      onPrimaryContainer: Color(4282724608),
      secondary: Color(4285815586),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294959269),
      onSecondaryContainer: Color(4284237069),
      tertiary: Color(4283655680),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290039881),
      onTertiaryContainer: Color(4281219328),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294965490),
      onBackground: Color(4280294161),
      surface: Color(4294965490),
      onSurface: Color(4280294161),
      surfaceVariant: Color(4293976519),
      onSurfaceVariant: Color(4283385139),
      outline: Color(4286740064),
      outlineVariant: Color(4292134316),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741349),
      inverseOnSurface: Color(4294701023),
      inversePrimary: Color(4294622488),
      primaryFixed: Color(4294959008),
      onPrimaryFixed: Color(4280687104),
      primaryFixedDim: Color(4294622488),
      onPrimaryFixedVariant: Color(4284236544),
      secondaryFixed: Color(4294959008),
      onSecondaryFixed: Color(4280687104),
      secondaryFixedDim: Color(4293182079),
      onSecondaryFixedVariant: Color(4284105483),
      tertiaryFixed: Color(4291948388),
      onTertiaryFixed: Color(4279705088),
      tertiaryFixedDim: Color(4290171467),
      onTertiaryFixedVariant: Color(4282272768),
      surfaceDim: Color(4293188041),
      surfaceBright: Color(4294965490),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294898401),
      surfaceContainer: Color(4294503644),
      surfaceContainerHigh: Color(4294109142),
      surfaceContainerHighest: Color(4293714385),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4283907840),
      surfaceTint: Color(4286142720),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4287983104),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283842311),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287394102),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282009600),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284972288),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294965490),
      onBackground: Color(4280294161),
      surface: Color(4294965490),
      onSurface: Color(4280294161),
      surfaceVariant: Color(4293976519),
      onSurfaceVariant: Color(4283122223),
      outline: Color(4285095497),
      outlineVariant: Color(4286937444),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741349),
      inverseOnSurface: Color(4294701023),
      inversePrimary: Color(4294622488),
      primaryFixed: Color(4287983104),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4285945600),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287394102),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285618208),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284972288),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283523840),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293188041),
      surfaceBright: Color(4294965490),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294898401),
      surfaceContainer: Color(4294503644),
      surfaceContainerHigh: Color(4294109142),
      surfaceContainerHighest: Color(4293714385),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281212928),
      surfaceTint: Color(4286142720),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283907840),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281212928),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283842311),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280100096),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282009600),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294965490),
      onBackground: Color(4280294161),
      surface: Color(4294965490),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293976519),
      onSurfaceVariant: Color(4281017106),
      outline: Color(4283122223),
      outlineVariant: Color(4283122223),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741349),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4294961604),
      primaryFixed: Color(4283907840),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282067456),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283842311),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282067456),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282009600),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280758528),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293188041),
      surfaceBright: Color(4294965490),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294898401),
      surfaceContainer: Color(4294503644),
      surfaceContainerHigh: Color(4294109142),
      surfaceContainerHighest: Color(4293714385),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294957971),
      surfaceTint: Color(4294622488),
      onPrimary: Color(4282395904),
      primaryContainer: Color(4293307392),
      onPrimaryContainer: Color(4281804544),
      secondary: Color(4293182079),
      onSecondary: Color(4282395904),
      secondaryContainer: Color(4283579396),
      onSecondaryContainer: Color(4294102923),
      tertiary: Color(4291751009),
      onTertiary: Color(4280955904),
      tertiaryContainer: Color(4289052987),
      onTertiaryContainer: Color(4280560896),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279702281),
      onBackground: Color(4293714385),
      surface: Color(4279702281),
      onSurface: Color(4293714385),
      surfaceVariant: Color(4283385139),
      onSurfaceVariant: Color(4292134316),
      outline: Color(4288450425),
      outlineVariant: Color(4283385139),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293714385),
      inverseOnSurface: Color(4281741349),
      inversePrimary: Color(4286142720),
      primaryFixed: Color(4294959008),
      onPrimaryFixed: Color(4280687104),
      primaryFixedDim: Color(4294622488),
      onPrimaryFixedVariant: Color(4284236544),
      secondaryFixed: Color(4294959008),
      onSecondaryFixed: Color(4280687104),
      secondaryFixedDim: Color(4293182079),
      onSecondaryFixedVariant: Color(4284105483),
      tertiaryFixed: Color(4291948388),
      onTertiaryFixed: Color(4279705088),
      tertiaryFixedDim: Color(4290171467),
      onTertiaryFixedVariant: Color(4282272768),
      surfaceDim: Color(4279702281),
      surfaceBright: Color(4282333229),
      surfaceContainerLowest: Color(4279373317),
      surfaceContainerLow: Color(4280294161),
      surfaceContainer: Color(4280557333),
      surfaceContainerHigh: Color(4281280799),
      surfaceContainerHighest: Color(4282004521),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294957971),
      surfaceTint: Color(4294622488),
      onPrimary: Color(4281672960),
      primaryContainer: Color(4293307392),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293445251),
      onSecondary: Color(4280227072),
      secondaryContainer: Color(4289367375),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4291751009),
      onTertiary: Color(4280429312),
      tertiaryContainer: Color(4289052987),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279702281),
      onBackground: Color(4293714385),
      surface: Color(4279702281),
      onSurface: Color(4294966007),
      surfaceVariant: Color(4283385139),
      onSurfaceVariant: Color(4292397488),
      outline: Color(4289700234),
      outlineVariant: Color(4287529580),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293714385),
      inverseOnSurface: Color(4281280799),
      inversePrimary: Color(4284302336),
      primaryFixed: Color(4294959008),
      onPrimaryFixed: Color(4279832576),
      primaryFixedDim: Color(4294622488),
      onPrimaryFixedVariant: Color(4282856192),
      secondaryFixed: Color(4294959008),
      onSecondaryFixed: Color(4279832576),
      secondaryFixedDim: Color(4293182079),
      onSecondaryFixedVariant: Color(4282856192),
      tertiaryFixed: Color(4291948388),
      onTertiaryFixed: Color(4279112448),
      tertiaryFixedDim: Color(4290171467),
      onTertiaryFixedVariant: Color(4281285376),
      surfaceDim: Color(4279702281),
      surfaceBright: Color(4282333229),
      surfaceContainerLowest: Color(4279373317),
      surfaceContainerLow: Color(4280294161),
      surfaceContainer: Color(4280557333),
      surfaceContainerHigh: Color(4281280799),
      surfaceContainerHighest: Color(4282004521),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294966007),
      surfaceTint: Color(4294622488),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294951199),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966007),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293445251),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294508499),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290434895),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279702281),
      onBackground: Color(4293714385),
      surface: Color(4279702281),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4283385139),
      onSurfaceVariant: Color(4294966007),
      outline: Color(4292397488),
      outlineVariant: Color(4292397488),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293714385),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4281870080),
      primaryFixed: Color(4294960305),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294951199),
      onPrimaryFixedVariant: Color(4280227072),
      secondaryFixed: Color(4294960305),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293445251),
      onSecondaryFixedVariant: Color(4280227072),
      tertiaryFixed: Color(4292277096),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290434895),
      onTertiaryFixedVariant: Color(4279441664),
      surfaceDim: Color(4279702281),
      surfaceBright: Color(4282333229),
      surfaceContainerLowest: Color(4279373317),
      surfaceContainerLow: Color(4280294161),
      surfaceContainer: Color(4280557333),
      surfaceContainerHigh: Color(4281280799),
      surfaceContainerHighest: Color(4282004521),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

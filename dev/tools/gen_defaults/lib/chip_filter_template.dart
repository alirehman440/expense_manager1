// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'template.dart';

class ChipFilterTemplate extends TokenTemplate {
  const ChipFilterTemplate(super.fileName, super.tokens);

  static const String tokenGroup = 'md.comp.filter-chip';
  static const String variant = '.flat';

  @override
  String generate() => '''
// Generated version ${tokens["version"]}
class _TokenDefaultsM3 extends ChipThemeData {
  const _TokenDefaultsM3(this.context, this.isEnabled, this.isSelected)
    : super(
        elevation: ${elevation("$tokenGroup$variant.container")},
        shape: ${shape("$tokenGroup.container")},
        showCheckmark: true,
      );

  final BuildContext context;
  final bool isEnabled;
  final bool isSelected;

  @override
  TextStyle? get labelStyle => ${textStyle("$tokenGroup.label-text")};

  @override
  Color? get backgroundColor => ${componentColor("$tokenGroup$variant.container")};

  @override
  Color? get shadowColor => ${color("$tokenGroup.container.shadow-color")};

  @override
  @override Color? get surfaceTintColor => ${color("$tokenGroup.container.surface-tint-layer.color")};

  @override
  Color? get selectedColor => isEnabled
    ? ${componentColor("$tokenGroup$variant.selected.container")}
    : ${componentColor("$tokenGroup$variant.disabled.selected.container")};

  @override
  Color? get checkmarkColor => ${color("$tokenGroup.with-icon.selected.icon.color")};

  @override
  Color? get disabledColor => isSelected
   ? ${componentColor("$tokenGroup$variant.disabled.selected.container")}
   : ${componentColor("$tokenGroup$variant.disabled.unselected.container")};

  @override
  Color? get deleteIconColor => ${color("$tokenGroup.with-icon.selected.icon.color")};

  @override
  BorderSide? get side => !isSelected
    ? isEnabled
      ? ${border('$tokenGroup$variant.unselected.outline')}
      : ${border('$tokenGroup$variant.disabled.unselected.outline')}
    : null;

  @override
  IconThemeData? get iconTheme => IconThemeData(
    color: isEnabled
      ? ${color("$tokenGroup.with-icon.icon.color")}
      : ${color("$tokenGroup.with-icon.disabled.icon.color")},
    size: ${tokens["$tokenGroup.with-icon.icon.size"]},
  );

  @override
  EdgeInsetsGeometry? get padding => const EdgeInsets.all(8.0);

  /// The chip at text scale 1 starts with 8px on each side and as text scaling
  /// gets closer to 2 the label padding is linearly interpolated from 8px to 4px.
  /// Once the widget has a text scaling of 2 or higher than the label padding
  /// remains 4px.
  @override
  EdgeInsetsGeometry? get labelPadding => EdgeInsets.lerp(
    const EdgeInsets.symmetric(horizontal: 8.0),
    const EdgeInsets.symmetric(horizontal: 4.0),
    clampDouble(MediaQuery.of(context).textScaleFactor - 1.0, 0.0, 1.0),
  )!;
}
''';
}
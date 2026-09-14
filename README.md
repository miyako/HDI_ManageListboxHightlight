# HDI_ManageListboxHightlight

A 4D **HDI** (How Do I) example project demonstrating how to control per-row
background color, font color, and font style of a list box driven by
`selection` or `array`-type data sources, including custom highlight colors
on selected rows.

## Origin

This project started as a binary `.4DB` example database originally
distributed with 4D. It was converted to the modern project architecture
(`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then
modernised (syntax, localisation, dark mode) with the help of **GitHub
Copilot**.

- **Blog post:** https://blog.4d.com/customize-highlight-color-upon-listbox-row-selection/
- **Original download:** https://download.4d.com/Demos/4D_v16_R2/HDI_ManageListboxHightlight.zip

## Features

- Per-row **background color**, **font color**, and **font style** driven by
  three parallel arrays (`ListboxBackground`, `ListboxFontColor`, and a style
  array), recomputed live as the selection changes.
- A dedicated **highlight color** applied only to selected rows, distinct
  from the normal alternating row colors, including separate "focused" vs
  "unfocused" (background window) tints.
- Category-based and value-based (positive/negative) conditional coloring,
  each with its own light/dark/disabled color triples.
- A **"Frontmost Window"** checkbox toggle showing how highlight colors
  should react to the list box's window losing/gaining focus.
- Sample data seeding from a bundled `SAMPLES.json` resource via `ds`
  (data model) and `JSON Parse`.
- Full **dark mode** support (`automatic`/`automaticAlternate` fills and
  strokes) and **Liquid Glass**-aware button sizing for macOS Tahoe.
- English and Japanese **XLIFF localisation** for every UI string.

## Points of Interest

| Area | File(s) | Notes |
|------|---------|-------|
| Live per-row coloring | `Project/Sources/Methods/Demo_SetColor.4dm` | Central dispatcher called from list box `background`/`font color` expressions; branches on column name and category/value/selection state. |
| Highlight color arrays | `Project/Sources/Methods/Demo_FillColorArrays.4dm`, `UI_FillArrays.4dm` | Populates the light/dark/disabled color arrays from hidden reference objects (`BgndMain1`, `BgndA1`, `BgndB1`...) via `OBJECT GET RGB COLORS`, so palette colors are edited visually on the form rather than hardcoded in code. |
| Background/font/style expressions | `UI_SetBackground.4dm`, `UI_SetFontColor.4dm`, `UI_SetStyle.4dm` | Small `#DECLARE`-based functions returning a single color/style value, referenced directly as list box column expressions. |
| Selection-driven highlighting | `Project/Sources/Forms/HDI2/method.4dm` (`On Selection Change`) | Rebuilds the highlight `Set` from the current list box selection so newly selected rows are recolored immediately. |
| Random-highlight demo buttons | `Project/Sources/Forms/HDI2/ObjectMethods/Button1-5.4dm` | Simulate selecting a random subset of rows (`Shift`-click bypasses the randomisation) to exercise the highlight logic without manual selection. |
| Startup / window management | `Project/Sources/Methods/00_Start.4dm`, `Project/Sources/Forms/HDI/ObjectMethods/BtnDemo.4dm` | Non-blocking `DIALOG(...;*)` splash pattern with window-reuse detection and `Form`-scoped state instead of interprocess variables. |
| Sample data loading | `Project/Sources/Forms/HDI2/method.4dm` (`On Load`) | Seeds the `SAMPLES` dataclass from `Resources/SAMPLES.json` on first load via `ds` and `JSON Parse`. |

## Project Structure

```
Project/Sources/
  Forms/HDI/             Splash/startup form and its BtnDemo object method
  Forms/HDI2/             Main demo form: list boxes, color swatches, controls
  Methods/                Startup, color-array, and list box expression methods
  styleSheets*.css        Dark mode + Liquid Glass button sizing
Resources/
  en.lproj/, ja.lproj/    XLIFF localisation (English source, Japanese target)
```

## Localisation

All user-facing text (menu items, form labels, splash/close button, list box
headers) is resolved via `:xliff:` references or `Localized string(...)`,
backed by `Resources/en.lproj/ManageListboxHightlightEN.xlf` (source) and
`Resources/ja.lproj/ManageListboxHightlightJA.xlf` (Japanese). Add further
`{lang}.lproj` folders to support additional languages.

## References

- List box color/style expressions: https://developer.4d.com/docs/FormObjects/listbox_overview#background-color-font-color-and-style
- `OBJECT GET/SET RGB COLORS`: https://developer.4d.com/docs/commands/object-get-rgb-colors
- Sets (`Is in set`, `ADD TO SET`): https://developer.4d.com/docs/commands-legacy/sets
- Data model / `ds`: https://developer.4d.com/docs/ORDA/dsMapping
- CSS in 4D (dark mode, Liquid Glass): https://developer.4d.com/docs/FormEditor/stylesheets

# DayZ Mod Builder

**Автор:** KRa Tos (Константин)

Веб-приложение для генерации исходников модов DayZ по [Bohemia Modding Structure](https://community.bohemia.net/wiki/DayZ:Modding_Structure).

## Открыть

1. Скачайте [`index.html`](index.html) (Raw → Save)
2. Откройте в браузере
3. Нажмите **Сгенерировать** → **Скачать ZIP**

Либо: [GitHub Pages](https://barsboot-bot.github.io/dayz-mod-builder/) (если включены Pages на ветке `main` / root).

## Файлы

| Файл | Назначение |
|------|------------|
| `index.html` | DayZ Mod Builder v2.0 — генератор структуры мода |
| `unesennye_mod_builder.html` | Хелпер Unesennye (serverDZ.cfg, RPC, stringtable) |

## Что генерирует

- `mod.cpp`
- `Scripts/config.cpp` (CfgPatches + CfgMods)
- слои `3_Game` / `4_World` / `5_Mission`
- `stringtable.csv`, `README.md`
- опционально `serverDZ.cfg`, предмет CfgVehicles
- шаблоны: Hello World, Script, Item, Client+Server split, Unesennye skeleton

## После ZIP

1. Исходники → `P:\Prefix`
2. Addon Builder → PBO
3. `@Prefix/Addons/*.pbo` + `.bikey` в `keys/`
4. `-mod=@Prefix` или `-serverMod=@Prefix`

`verifySignatures = 2` требует ключ мода на сервере.

# DayZ Mod Builder

**Автор:** KRa Tos (Константин)

Веб- и **портативное** приложение для генерации исходников модов DayZ по [Bohemia Modding Structure](https://community.bohemia.net/wiki/DayZ:Modding_Structure).

## Веб

Скачайте [`index.html`](index.html) → откройте в браузере.

## Portable Windows 10/11

Папка [`portable/`](portable/):

| Файл | Запуск |
|------|--------|
| `START.cmd` / `DayZModBuilder.vbs` | Edge/Chrome в режиме приложения (без консоли) |
| `DayZModBuilder.bat` | То же через BAT |
| `DayZModBuilder_WinForms.bat` | Отдельное окно Windows (PowerShell) |

**Установка не нужна.** Распакуйте репозиторий или ZIP и запустите `portable\START.cmd`.

Полный ZIP-дистрибутив с `app\index.html` внутри: соберите локально или скачайте релиз (если опубликован).

## Генерация

- `mod.cpp`, `Scripts/config.cpp`
- слои 3_Game / 4_World / 5_Mission
- stringtable, README, опционально serverDZ.cfg
- шаблоны: Hello World, Script, Item, Client+Server, Unesennye

## После ZIP исходников

1. `P:\Prefix`
2. Addon Builder → PBO
3. `@Prefix/Addons` + `keys/*.bikey`
4. `-mod=@Prefix` или `-serverMod=@Prefix`

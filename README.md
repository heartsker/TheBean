![coffee](https://user-images.githubusercontent.com/51203539/160007650-3f1aef5a-b351-458e-909b-c19bd10844d6.png)

> Вы любите кофе? У нас это есть!
> 
> Love coffee? We got you!

# Документация - TheBean
## Организация
Информацию про внутреннюю инфраструктуру и организацию Nephew-Ustas можно найти [тут](https://github.com/Nephew-Ustas/Nephew-Ustas#readme).

## Локализация

[Интерфейс](https://github.com/Nephew-Ustas/TheBean/blob/11cbecabf6beee338b9b0e12d3f28feb8a37a52d/TheBean/Localization/ILocalizable.swift#L10) локализации - `ILocalizable`.

Чтобы добавить новый сервис локализации, необходимо исполнить требования `ILocalizable` и добавить требуемые строки:

```swift
    class AppLocalization: ILocalizable {
        static let table: String = "App"
        static let name = AppLocalization.localize("name")
    }
```

после этого в соответствующей таблице `App.strings` нужно определить локализацию строк:

```swift
// App (English)
"name" = "The Bean";
```

```swift
// App (Russian)
"name" = "Зе рно";
```

# Документация - TheBean

## Локализация

Интерфейс локализации - `ILocalizable`.

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
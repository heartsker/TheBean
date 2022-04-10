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

## Assets
[Интерфейс]() `IAssetsManager` позволяет использовать в коде файлы из папки Assets.

Например, для получения картинок реализован [класс]() `ImageManager`:
```swift
class ImageManager: IAssetsManager {
    typealias Asset = UIImage

    static let latte = ImageManager.asset(for: "coffee.latte")
}
```

Тогда в коде следует использовать `ImageManager.latte`.
## Combine
Класс [`Publisher`](https://github.com/Nephew-Ustas/TheBean/blob/5275158b6fc56e4e2840b4c1425f202a1adffeef/TheBean/Model/Account/Notifications.swift#L15) позволяет создавать публикации изменений и подписываться на них.

Чтобы создать публикацию используется метод `publishPost<T>(with:, for:)`.

Для подписки на обновления используется метод `subscribe<T>(_: T, keyPath:, for:)`.

Таким образом, для подписания текста лейбла на обновления имени аккаунта используется следующий код:
```swift
let label = UILabel()
Publisher.subscribe(label, keyPath: \.text, for: .usernamePost)
```

Для того, чтобы опубликовать изменения имени, можно использовать такой код:
```swift
Publisher.publishPost(with: username, for: .usernamePost)
```

В примерах выше используется
```swift
extension Notification.Name {
    static let usernamePost = Notification.Name("usernamePost")
}
```

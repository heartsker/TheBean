![coffee](https://user-images.githubusercontent.com/51203539/160007650-3f1aef5a-b351-458e-909b-c19bd10844d6.png)

> Вы любите кофе? У нас это есть!
> 
> Love coffee? We got you!

# Документация - TheBean

## Установка и запуск
Для начала нужно склонировать репозиторий
```zsh
git clone https://github.com/Nephew-Ustas/TheBean.git
```
Затем необходимо перейти на нужную ветку (например `TIC-1703`):
```zsh
git checkout TIC-1703
```
Или если необходимо, то сначала создать новую ветку:
```zsh
git branch TIC-1703
git checkout TIC-1703
```
После этого в директории проекта необходимо исполнить скрипт из `makefile`. Для подробной информации вызвать
```zsh
make help
```
Для внесения изменений ветки в репозиторий вызвать
```zsh
make git t='title' b='body'
```
* `title` - Заголовок коммита
* `body` - Детальное описание коммита *(опционально)*
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
# Лабораторна робота № 1. Проєктування AI-агента для автоматизації розробки та CI/CD

Виконав: студент групи КІ-405, Біланин Роман Андрійович
Варіант: 4 (Мова: Rust, Система складання: Cargo, Тестування: cargo test)
GitHub: https://github.com/romanbilanynki2023

## Опис проєкту
Метою проєкту є створення мінімального кросплатформного застосунку "Hello World" мовою Rust та тестів до нього за допомогою спеціалізованого AI-агента. Проєкт включає налаштування автоматичного складання, юніт-тестування та CI/CD workflow для Windows, Linux і macOS через GitHub Actions.

## Гілки
- `develop` — AI-агент (manifest, skills, commands) та інструкції.
- `feature/develop` — повний проєкт, згенерований агентом.

## Запуск AI-агента
1. Відкрити репозиторій у VS Code з активним GitHub Copilot.
2. Відкрити Copilot Chat і вибрати режим Agent.
3. Виконати команду `/init-agent` (orchestrator). Вона послідовно запускає git-init, create-project, create-build, create-actions і check.
4. Окремі команди: `/git-init`, `/create-project`, `/create-build`, `/create-actions`, `/check`.

## Запуск проєкту
- Складання: `cargo build --release`
- Тести: `cargo test`
- Запуск: `cargo run`
- Повна локальна перевірка: `./ci.sh` (Linux/macOS) або `ci.bat` (Windows)

Детально: `docs/usage.md`, `docs/architecture.md`, `docs/ai-log.md`.
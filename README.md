# FitnesPulse — сеть фитнес клубов

Учебный-проект : посетители просмотривает список фитнес клубов, покупка абонементов, отзывы.
![[README]]
Проект состоит из двух частей:

| Часть | Что это |
|---|---|
| `server/` | REST API  |
| `client/` | Сайт для покупателей | 


---

## Возможности

### Клиент (сайт на React)
- Регистрация и вход, токен хранится в `localStorage` (Sanctum, `Authorization: Bearer`).
- Каталог с поиском, фильтрами по регионам.
- Карточка клуба, отзывы и рейтинг.
- Личный кабинет, оформление абонемента , история покупок.
- Оценка зала и тренера.

## Требования

- **PHP 8.3+** с расширениями: `pdo_mysql`, `mysql`, `mbstring`, `intl`, `fileinfo`, `openssl`, `curl`, `zip`
- **Composer 2**
- **MySQL 14+** (утилиты `mysql` должны быть доступны в терминале)
- **Node.js 20.19+** (или 22+) и npm — для фронтенда


---

## Запуск

Порядок: **база данных → бэкенд → фронтенд**.

### 1. Бэкенд: установка

```bash
cd server
composer install
cp .env.example .env
php artisan key:generate
```

### 2. Настройка `.env`

Откройте `server/.env` и укажите подключение к MySQL (в `.env.example` по умолчанию стоит SQLite — замените):

```dotenv
APP_LOCALE=ru
APP_TIMEZONE=Asia/Almaty
APP_URL=http://localhost:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=fitnesPulse
DB_USERNAME=root
DB_PASSWORD=ваш_пароль

# Загружаемые файлы (картинки залов и аватары) должны попадать в публичный диск
FILESYSTEM_DISK=public
```

> `.env` содержит пароли — не публикуйте его и не добавляйте в git.

### 3. Создайте базу данных


```bash
mysql -u root -p -e "CREATE DATABASE fitnesPulse CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
```

Имя базы должно совпадать с `DB_DATABASE`. Пустая база нужна в обоих вариантах ниже.

### 4. Наполните базу

```bash
php artisan migrate
php artisan db:seed
```

### 5. Картинки и запуск сервера

```bash
php artisan storage:link
php artisan optimize:clear
php artisan serve
```

Бэкенд запустится на **http://localhost:8000**.

> Фронтенд обращается к API по адресу `http://localhost:8000` (он указан прямо в компонентах), поэтому бэкенд должен работать именно на порту 8000. Если картинки из дампа не отображаются, скопируйте файлы товаров и аватаров в `server/storage/app/public/products` и `server/storage/app/public/avatars`.

### 6. Фронтенд

В новом окне терминала:

```bash
cd client
npm install
npm run dev
```

Сайт откроется по адресу, который выведет Vite (обычно **http://localhost:5173**).

Сборка для продакшена:

```bash
npm run build
```

---

## Адреса

| Что | Адрес |
|---|---|
| Сайт (покупатели) | http://localhost:5173 |
| API | http://localhost:8000/api/v1 |

---

## Известные ограничения

- На фронтенде не доделаны страницы абонементов, личного кабинета и отзывов.

# База данных  
## Обзор
В репозиторий представлена база данных студии самозаписи
ER диаграмма базы данныз
![ER диаграмма](https://git.miem.hse.ru/19107/database/-/raw/master/ER.png)  
## Иерархия  
```
.  
|   README.md
|   ER.png
|───images
|   |   add_server.png
|   |   server_settings.png
|   
|───db
    |   docker-compose.yml
    |   
    |───database
        |   Dockerfile
        |
        |───initSQL
            |   init.sql   
```
## Ссылки для работы  
* pgAdmin: http://localhost:5050/browser
* postgresql: http://localhost:5432/

## запуск
* в командной строке перейти в каталог ./db/
* выполнить `docker-compose build`
* выполнить `docker-compose up`
* зайти по адрессу http://localhost:5050/browser в pgAdmin
* нажать _Add Server_  
![add_server](https://git.miem.hse.ru/19107/database/-/raw/master/images/add_server.png)
* ввести настройки подключения  
    Host name `database_container`  
    Port `5432`  
    Maintenance database `SelfRecordingDatabase`  
    username и password `admin`  
    ![server_settings](https://git.miem.hse.ru/19107/database/-/raw/master/images/server_settings.png)
* нажать _Save_  
* можно работать с базой данных  

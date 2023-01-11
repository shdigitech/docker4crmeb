# Docker Compose

This is a Docker Compose configuration for quickly and easily spinning up a test / development environment for CRMEB. 

- A few links of CRMEB
    
    [https://www.crmeb.com/](https://www.crmeb.com/)
    
    [https://doc.crmeb.com/pro_s/pro_single](https://doc.crmeb.com/pro_s/pro_single)
    

The CRMEB application code will be running in this environment can be downloaded here.

[https://gitee.com/ZhongBangKeJi/CRMEB](https://gitee.com/ZhongBangKeJi/CRMEB)

This compose file defines an application with four services: `nginx`, `php`, `MySQL`, `Redis`. The image for `php` is built with the `Dockerfile` inside the `php` directory. It builds on top of php `7.4` with extra php extensions required by CRMEB. Additionally, `Supervisor` is also built-in which is required by CRMEB to run `Queue`.

When deploying the application, docker compose maps the container port `80` to port `28038` of the host as specified in the file. Make sure port `28038` on the host is not occupied, otherwise the port should be changed.

## Prerequisites

Minimum requirement is to have **Docker**, **Docker Compose** and **Git** installed. Debian / Ubuntu OS is recommended.

This setup has been tested on both vanilla and WSL versions of Ubuntu Server 20.04 with following versions of applications.

- Docker version 20.10.21
- Docker Compose version v2.13.0
- Git version 2.25.1

Earlier versions may also work but haven’t been tested.

## How to use

1. Clone this repo

    
    ```bash
    git clone https://github.com/shdigitech/docker4crmeb.git
    ```
    
2. Clone CRMEB application code:
    
    ```bash
    git clone https://gitee.com/ZhongBangKeJi/CRMEB.git
    ```
    
3. Check you have the folder structure like this(both repos sit on the same level)
    
    ```bash
    .
    ├── CRMEB
    └── docker4crmeb
    ```
    
4. Set file permissions required in later installation

    
    ```bash
    sudo chmod 777 ./CRMEB/crmeb/public ./CRMEB/crmeb/runtime ./CRMEB/crmeb/.env ./CRMEB/crmeb/.version ./CRMEB/crmeb/.constant -R
    ```
    
5. Enter the docker-compose folder and spin up containers

    
    ```bash
    cd docker4crmeb
    docker compose pull php-fpm && docker compose up -d
    ```
    
    <aside>
    💡 First time build might take a while depending on your hardware configuration, be patient.
    
    </aside>
    
    <aside>
    💡 Omitting the ‘-d’ parameter will output a bunch of logs on the console, which could be helpful for debugging. Note that pressing Ctrl + C or closing the console window will shutdown all containers.
    
    </aside>
    
6. Now open your favorite browser and navigate to
    
    [http://localhost:28038/](http://localhost:28038/)
    
    You shall see the installation wizard page of CRMEB
    
7. Configuration for services(other fields can be left default)
    
    
    | 数据库MySql配置 |  |
    | --- | --- |
    | 数据库服务器 | mysql |
    | 数据库端口 | 3306 |
    | 数据库用户名 | crmeb |
    | 数据库密码 | crmeb |
    | 数据库名 | crmeb |
    
    | Redis配置 |  |
    | --- | --- |
    | 服务器地址 | redis |
    | 端口号 | 6379 |
8. After installation finishes, you can access the frontend site and admin site respectively at
    1. [http://localhost:28038](http://localhost:28038)
    2. [http://localhost:28038/admin](http://localhost:28038/admin)
    
    <aside>
    💡 Note: at the time of writing this document, CRMEB has a bug that the admin page will redirect to its login page on port 80 instead of our custom port, simply add the port number back to the login page URL and you should be able to access the login page.
    
    </aside>
    
9. This docker-compose combo also packs a PHPMYADMIN for easy database access, you can find it at
    
    [http://localhost:28039/](http://localhost:28039/)
    
10. To shut everything down
    
    ```bash
    docker compose down
    ```
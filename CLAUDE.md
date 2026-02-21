# CLAUDE.md

此文件为 Claude Code (claude.ai/code) 在本项目中工作时提供指导。

## 项目概述

这是个人 docker-compose 配置文件仓库，包含多个服务的配置。每个子目录都包含一个完整的服务 docker-compose 配置。

## 可用服务

| 目录 | 服务 | 说明 |
|------|------|------|
| `allinone/` | All-in-one 容器 | 多用途容器 |
| `hass/` | Home Assistant | 家庭自动化平台 |
| `kafka/` | Apache Kafka | 消息队列 |
| `mongo/` | MongoDB | NoSQL 数据库 |
| `mysql/` | MySQL 8.0 | 关系型数据库 |
| `nginx/` | Nginx | 反向代理 |
| `oracle/` | Oracle 数据库 | Oracle 数据库 |
| `redis/` | Redis | 内存缓存 |

## 常用命令

```bash
# 启动指定服务（从对应目录）
cd <service-directory>
docker-compose up -d

# 停止指定服务
docker-compose down

# 查看日志
docker-compose logs -f

# 从任意目录启动指定的 compose 文件
docker-compose -f <service-directory>/docker-compose.yaml up -d
```

## 项目结构

- 每个服务独立存放在各自的子目录中
- 数据卷通常挂载为相对于 compose 文件的 `./data`
- 配置文件（如 `redis/conf/`）从子目录挂载

# CLAUDE.md

此文件为 Claude Code (claude.ai/code) 在本项目中工作时提供指导。

## 项目概述

这是个人 docker-compose 配置文件仓库，包含多个服务的配置。每个子目录都包含一个完整的服务 docker-compose 配置。

## 可用服务

| 目录 | 服务 | 端口 | 说明 |
|------|------|------|------|
| `allinone/` | All-in-one | - | 多用途容器 |
| `hass/` | Home Assistant | - | 家庭自动化平台 |
| `kafka/` | Apache Kafka + Zookeeper | - | 消息队列 |
| `mongo/` | MongoDB | - | NoSQL 数据库 |
| `mysql/` | MySQL 8.0 | - | 关系型数据库 |
| `nginx/` | Nginx 1.14 | - | 反向代理 |
| `openclaw/` | OpenClaw | 18789 | openclaw |
| `oracle/` | Oracle 11g XE | - | Oracle 数据库 |
| `redis/` | Redis 6.0 | - | 内存缓存 |

## 常用命令

```bash
# 启动指定服务（从对应目录）
cd <service-directory>
docker compose up -d

# 停止指定服务
docker compose down

# 查看日志
docker compose logs -f

# 从任意目录启动指定的 compose 文件
docker compose -f <service-directory>/docker-compose.yaml up -d

# 更新镜像并重启
docker compose pull
docker compose up -d

# 查看服务状态
docker compose ps
```

## 最佳实践

- **首次使用**：先 `docker compose pull` 拉取最新镜像再启动
- **指定 compose 文件路径**：`docker compose -f kafka/docker-compose.yaml up -d` 可从仓库根目录直接启动任意服务
- **数据持久化**：各服务数据存储在对应目录的 `data/` 下，删除前请确认
- **配置文件**：部分服务（如 redis/conf/）包含自定义配置文件，修改后需重启容器生效
- **env 文件**：如需环境变量，在对应目录创建 `.env` 文件（参考 `.env.example` 若存在）
- **网络模式**：如需多个服务互通，可创建共享 network 或将服务接入同一网络

## 项目结构

- 每个服务独立存放在各自的子目录中
- 数据卷通常挂载为相对于 compose 文件的 `./data`
- 配置文件（如 `redis/conf/`）从子目录挂载

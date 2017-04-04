# Trouble Shooting

Below is a list of issues that various folks have come across while trying to setup these tools

### Error bringing up postgres

```
ERROR: for postgres  Cannot start service postgres: driver failed programming external connectivity on endpoint projectmanagement_postgres_1 (d696e6fdf0beb07aac67253dcbe1a4f5e214dcfe33915b31ee80aae72316ec4b): Bind for 0.0.0.0:5432 failed: port is already allocated
ERROR: Encountered errors while bringing up the project.
```
This occurs when docker attempts to allocate a port that is currently in use.  The most common cause is trying to bring up the postgres image while postgres is running locally.

#### Solution

1. Turn off postgres while running the tool
2. Change the port specified in the `docker-compose.yml`.  Look for `ports` section of the file and change the number on the left to a value not in use.

#!/bin/bash

# 유틸리티(function, extension) 생성에 필요한 sql 파일을 먼저 실행한다.
for filename in /docker-entrypoint-initdb.d/create/utils/*.sql; do
  psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$filename"
done

# create 폴더에 있는 sql 파일을 실행한다.
for filename in /docker-entrypoint-initdb.d/create/tables/*.sql; do
  psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$filename"
done

# insert 폴더에 있는 sql 파일을 실행한다.
for filename in /docker-entrypoint-initdb.d/insert/*.sql; do
  psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f "$filename"
done

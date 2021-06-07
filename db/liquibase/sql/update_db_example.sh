#!/bin/bash

liquibase \
    --password=PROMPT                           \ 
    --url=jdbc:postgresql://<host>:<port>/<db>  \
    --username=<username>                       \ 
    --defaultSchemaName=<schema>                \
    update



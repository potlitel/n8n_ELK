#!/bin/bash

# Esperar a que Elasticsearch esté disponible
until curl -s http://elasticsearch:9200; do
  echo "Esperando a que Elasticsearch esté disponible..."
  sleep 5
done

# Crear índice
curl -X PUT "http://elasticsearch:9200/mi_indice" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 1
  },
  "mappings": {
    "properties": {
      "campo1": { "type": "text" },
      "campo2": { "type": "date" }
    }
  }
}'

# Esperar a que el índice esté disponible
until curl -s -o /dev/null -w "%{http_code}" "http://elasticsearch:9200/mi_indice" | grep -q "200"; do
  echo "Esperando a que el índice esté disponible..."
  sleep 5
done

# Crear patrón de índice en Kibana
curl -X POST "http://kibana:5601/api/saved_objects/index-pattern" -H 'Content-Type: application/json' -H 'kbn-xsrf: true' -d'
{
  "attributes": {
    "title": "n8n-logs-*",
    "timeFieldName": "timestamp"  # Cambia esto al nombre del campo de tiempo que estés utilizando
  }
}'

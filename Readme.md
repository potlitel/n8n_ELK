 # 🔥n8n-ELK-Integration

## ✍️Descripción

Este repositorio contiene una guía y ejemplos para implementar n8n junto con ELK (Elasticsearch, Logstash y Kibana). n8n es una plataforma de automatización de flujos de trabajo que permite integrar diferentes aplicaciones y servicios de manera sencilla. La integración con ELK permite la recopilación, análisis y visualización de datos generados por los flujos de trabajo automatizados.

## ✨Características

- **Automatización de Flujos de Trabajo**: Utiliza n8n para crear flujos de trabajo que interactúan con servicios de ELK.
- **Visualización de Datos**: Configura Kibana para visualizar los datos procesados por Elasticsearch.
- **Monitoreo y Análisis**: Implementa Logstash para el procesamiento de datos en tiempo real.

## ✅Requisitos

- **n8n**: Asegúrate de tener n8n instalado y funcionando. Puedes encontrar la documentación oficial [aquí](https://docs.n8n.io).
- **ELK Stack**: Debes tener Elasticsearch, Logstash y Kibana instalados. Consulta la [documentación de ELK](https://www.elastic.co/guide/en/elastic-stack/current/index.html) para más detalles.

## 🛠️Instalación

### 1. **Clona el repositorio**:
   ```bash
    git clone https://github.com/potlitel/n8n_ELK.git
    cd n8n-ELK-Integration
   ```
 
### 2. docker-compose up -d elasticsearch kibana 

    ```bash
        time="2025-09-01T10:45:44-04:00" level=warning msg="C:\\Users\\potli\\source\\repos\\n8n_ELK\\docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion"
        [+] Running 3/3
        ✔ Network n8n_elk_default  Created                                          0.1s
        ✔ Container elasticsearch  Started                                           0.5s
        ✔ Container kibana         Started    
    ```

### 3. Configurar Elasticsearch y Kibana

    Elasticsearch: Asegúrate de que Elasticsearch esté funcionando y accesible en http://localhost:9200.

    To check if Elasticsearch is running execute the following command in the terminal:

    ```bash
        curl http://localhost:9200/_cluster/health?pretty
    ```

    Debe obtener una salida similar a la siguiente:

    ```bash
        StatusCode        : 200
        StatusDescription : OK
        Content           : {
                            "cluster_name" : "docker-cluster",
                            "status" : "green",
                            "timed_out" : false,
                            "number_of_nodes" : 1,
                            "number_of_data_nodes" : 1,
                            "active_primary_shards" : 8,
                            "active_shards" : 8,
                            "relo...
        RawContent        : HTTP/1.1 200 OK
                            X-elastic-product: Elasticsearch
                            Content-Length: 467
                            Content-Type: application/json; charset=UTF-8

                            {
                            "cluster_name" : "docker-cluster",
                            "status" : "green",
                            "timed_out" : fa...
        Forms             : {}
        Headers           : {[X-elastic-product, Elasticsearch], [Content-Length, 467], [Content-Type, application/json; charset=UTF-8]}
        Images            : {}
        InputFields       : {}
        Links             : {}
        ParsedHtml        : System.__ComObject
        RawContentLength  : 467
    ```

### 4. Kibana: Configura un patrón de índice en Kibana para visualizar los logs:

    Asegúrate de que esté funcionando y accesible en http://localhost:5601.
    4.1 Ve a Management > Index Patterns.
    4.2 Crea un nuevo patrón de índice con el nombre n8n-logs-*.
    4.3 Configura el campo de tiempo (timestamp) para habilitar la visualización cronológica.

### 5.  Verificar el flujo de logs

    5.1 Generar logs en n8n: Realiza acciones en n8n para generar logs.
    5.2 Revisar Logstash: Verifica que Logstash esté procesando los logs correctamente.

    ```bash
        docker-compose logs logstash
    ```

### 6. Visualizar en Kibana: Accede a Kibana en http://localhost:5601 y verifica los logs en el índice n8n-logs-*.


### 7. Solución de errores:

#### 7.1- FATAL Error: Unable to complete saved object migrations for the [.kibana] index. Please check the health of your Elasticsearch cluster and try again:

2-
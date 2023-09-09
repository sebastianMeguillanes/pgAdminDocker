FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
  postgresql-client \
  pgadmin4

# Instalar dependencias de Python para pgAdmin
RUN apt-get install -y python3 python3-pip && pip3 install psycopg2

# Configurar pgAdmin
ENV PGADMIN_PORT=5050

# Exponer puerto de pgAdmin
EXPOSE 5050

# Agregar servidor de base de datos en pgAdmin
RUN echo "hostaddr=clmc31ap700kzpmcg8y9b8cxs port=5432 dbname=mydb username=admin password=admin1234" > /etc/pgadmin/servers.xml

# Iniciar pgAdmin al ejecutar el contenedor 
CMD ["pgadmin4"]
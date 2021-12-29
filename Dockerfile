FROM node:14-alpine AS build
# Add a work directory
WORKDIR /app
# Cache and Install dependencies
COPY package.json .
COPY yarn.lock .
RUN yarn install
# Copy app files
COPY . .
# ARG REACT_APP_NAME
# ENV REACT_APP_NAME=$REACT_APP_NAME
# Start the app
RUN yarn run build

# CREATE NGINX SERVER
FROM nginx:alpine AS prod-stage

EXPOSE 80

COPY --from=build /app/build /usr/share/nginx/html

#corriendo comando de nginx
CMD [ "nginx", "-g", "daemon off;" ]

# Para contenedores Docker (o para depuración), la directiva daemon off; Le dice a Nginx que permanezca en primer plano. Para los contenedores esto es útil ya que la mejor práctica es para un contenedor = un proceso. Un servidor (contenedor) tiene solo un servicio.

# La configuración daemon off; También es útil si hay una herramienta de terceros como Supervisor que controla sus servicios. Supervisor le permite detener/iniciar/obtener el estado de los grupos de servicios a la vez.
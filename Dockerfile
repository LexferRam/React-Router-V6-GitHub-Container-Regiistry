# FROM node:14-alpine AS build
# # Add a work directory
# WORKDIR /app
# # Cache and Install dependencies
# COPY package.json .
# COPY yarn.lock .
# RUN yarn install
# # Copy app files
# COPY . .
# # ARG REACT_APP_NAME
# # ENV REACT_APP_NAME=$REACT_APP_NAME
# # Start the app
# RUN yarn run build

# # CREATE NGINX SERVER
# FROM nginx:alpine AS prod-stage

# EXPOSE 80

# COPY --from=build /app/build /usr/share/nginx/html

# #corriendo comando de nginx
# CMD [ "nginx", "-g", "daemon off;" ]

# # Para contenedores Docker (o para depuración), la directiva daemon off; Le dice a Nginx que permanezca en primer plano. Para los contenedores esto es útil ya que la mejor práctica es para un contenedor = un proceso. Un servidor (contenedor) tiene solo un servicio.

# # La configuración daemon off; También es útil si hay una herramienta de terceros como Supervisor que controla sus servicios. Supervisor le permite detener/iniciar/obtener el estado de los grupos de servicios a la vez.


# PORTAL ERROR CONTAINER IMAGE

# STAGE 1 DEPENDENCIES INSTALLATION PROCESS

FROM node:16-alpine3.13 AS install

RUN apk add --no-cache libc6-compat

RUN apk add vim -v --progress

RUN apk add nano -v --progress

WORKDIR /home/node/app

COPY package.json ./

RUN yarn install

# STAGE 2 APP BUILDING PROCESS

FROM node:16-alpine3.13 AS build

RUN apk add --no-cache libc6-compat

RUN apk add vim -v --progress

RUN apk add nano -v --progress

WORKDIR /home/node/app

RUN mkdir node_modules

COPY . .

COPY --from=install /home/node/app/node_modules ./node_modules

COPY --from=install /home/node/app/yarn.lock .

ENV GENERATE_SOURCEMAP=false

ENV NODE_OPTIONS=openssl-legacy-provider

ENV PUBLIC_URL=/test

RUN yarn build

# STAGE 3 DESPLIEGUE DE LA APLICACION EN SERVIDOR NGINX

FROM nginx:1.21.4-alpine

RUN apk add --no-cache libc6-compat

RUN apk add vim -v --progress

RUN apk add nano -v --progress

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

RUN mkdir ./test

RUN chown -R nginx:nginx ./test

COPY default.conf /etc/nginx/conf.d

COPY --from=build --chown=nginx:nginx /home/node/app/build /usr/share/nginx/html/test

RUN touch /var/run/nginx.pid && chown nginx:nginx /var/run/nginx.pid  && chown -R nginx:nginx /var/cache/nginx/

EXPOSE 9002

USER nginx

ENTRYPOINT ["nginx", "-g", "daemon off;"]

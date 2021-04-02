#specify base image
FROM node:12.18.1 as builder


#ustawienie domyslnego katalogu
WORKDIR /usr/app

#skopiowanie plików json (kopiuje do katalogu WORKDIR)
#kopiuje tylko package.json - bo tego pliku potrzebuje npm install (kolejny krok)
COPY ./package.json ./

#install some dependencies
RUN npm install

#kopiuje wszystko inne co nie wymaga npm install
#dzieki temu wykorzystany jest cache zrobiony w RUN npm install
COPY ./ ./

#RUN npm run build

#default command
#CMD ["npm", "start"]


FROM nginx
COPY --from=builder /usr/app /usr/share/nginx/html

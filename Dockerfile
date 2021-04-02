#specify base image
FROM node:12.18.1
EXPOSE 8080

#ustawienie domyslnego katalogu
WORKDIR /usr/app

#skopiowanie plik�w json (kopiuje do katalogu WORKDIR)
#kopiuje tylko package.json - bo tego pliku potrzebuje npm install (kolejny krok)
COPY ./package.json ./

#install some dependencies
RUN npm install

#kopiuje wszystko inne co nie wymaga npm install
#dzieki temu wykorzystany jest cache zrobiony w RUN npm install
COPY ./ ./

#default command
CMD ["npm", "start"]
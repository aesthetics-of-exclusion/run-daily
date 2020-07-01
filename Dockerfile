FROM nikolaik/python-nodejs

RUN apt-get update -y && apt-get install -y gconf-service \
  libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
  libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 \
  libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 \
  libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 \
  libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
  libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 \
  lsb-release xdg-utils wget

RUN useradd -m aoe
WORKDIR /home/aoe
USER aoe

RUN git clone https://github.com/aesthetics-of-exclusion/mask-facades.git \
  && git clone https://github.com/aesthetics-of-exclusion/street-view-screenshots.git \
  && git clone https://github.com/aesthetics-of-exclusion/database.git

RUN cd mask-facades && npm install
RUN cd street-view-screenshots && npm install
RUN cd database && npm install

COPY --chown=aoe:aoe google-cloud-credentials.json ./
ENV SERVICE_KEY=/home/aoe/google-cloud-credentials.json

RUN mkdir /home/aoe/run-daily
WORKDIR /home/aoe/run-daily
COPY --chown=aoe:aoe run-daily.sh ./
COPY --chown=aoe:aoe package*.json ./
COPY --chown=aoe:aoe index.js ./
RUN npm install --only=production

CMD ["npm", "start"]

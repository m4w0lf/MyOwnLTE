FROM node:lts-bookworm

WORKDIR /tmp

RUN git clone https://github.com/open5gs/open5gs && \
	mv open5gs/webui /opt/open5gs-webui && rm -rf /tmp/open5gs && cd /opt/open5gs-webui && \
	npm clean-install && npm run build

WORKDIR /opt/open5gs-webui

ENV NODE_ENV production

CMD ["node","server/index.js"]

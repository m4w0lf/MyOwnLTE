FROM debian:bookworm-slim AS builder

RUN apt-get update && apt-get install -y \
	git \
        build-essential \
        gcc \
        g++ \
        make \
        automake \
        autoconf \
        libtool \
        pkg-config \
        libtalloc-dev \
	libnftnl-dev \
        libpcsclite-dev \
        libortp-dev \
        libsctp-dev \
        libssl-dev \
        libdbi-dev \
        libdbd-sqlite3 \
        libsqlite3-dev \
        libpcap-dev \
        libc-ares-dev \
        libgnutls28-dev \
        libsctp-dev \
        sqlite3 \
        libsofia-sip-ua-glib-dev \
        libuhd-dev \
	libmnl-dev \
        libusb-1.0-0-dev \
	dahdi-source \
	liburing-dev


RUN mkdir /tmp/buildroot

WORKDIR /tmp/buildroot

RUN git clone https://gitea.osmocom.org/osmocom/libosmocore.git && \
        cd libosmocore && \
        autoreconf -fi && \
        ./configure  && \
        make -j4 && \
        make install && \
        ldconfig 

RUN git clone https://gitea.osmocom.org/cellular-infrastructure/osmo-ggsn.git && \
        cd osmo-ggsn && \
        autoreconf -i && \
        ./configure && \
        make -j4 && \
        make install && \
        ldconfig -i

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
                libi2c0 \
                libusb-1.0-0 \
                libfftw3-bin \
                libmbedtls14 \
                libboost-program-options1.74.0  \
                libconfig++9v5 \
                libsctp1 \
                libtalloc2 \
                libpcsclite1 \
                libpcap0.8 \
                libgnutls30 \
                libmnl0 \
                libortp16 \
                wget \
		libdbi1 \
		libdbd-sqlite3 \
		liburing2 \
        && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/ /usr/local/

RUN ldconfig

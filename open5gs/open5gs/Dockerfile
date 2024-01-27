FROM debian:bookworm-slim AS builder

RUN apt-get update && apt-get install -y \
                build-essential \
		python3-pip \
		python3-setuptools \
		python3-wheel \
		ninja-build \
		build-essential \
		flex \
		bison \
		git \
		cmake \
		libsctp-dev \
		libgnutls28-dev \
		libgcrypt-dev \
		libssl-dev \
		libidn11-dev \
		libmongoc-dev \
		libbson-dev \
		libyaml-dev \
		libnghttp2-dev \
		libmicrohttpd-dev \
		libcurl4-gnutls-dev \
		libnghttp2-dev \
		libtins-dev \
		libtalloc-dev \
		meson


RUN mkdir /tmp/buildroot

WORKDIR /tmp/buildroot

RUN git clone https://github.com/open5gs/open5gs && \
	cd open5gs && \
	meson build --prefix=/opt/open5gs && \
	ninja -C build && cd build && ninja install


FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
                libsctp1 \           
                libgnutls30 \           
                libgcrypt20 \           
                libssl3 \           
                libidn12 \           
                libmongoc-1.0-0 \           
                libbson-1.0-0  \           
                libyaml-0-2  \           
                libnghttp2-14 \           
                libmicrohttpd12 \           
                libcurl4 \           
                libtins4.0 \           
                libtalloc2 \
				libcurl3-gnutls \
		screen \
        && rm -rf /var/lib/apt/lists/*

COPY --from=builder /opt/open5gs /opt/open5gs

RUN ldconfig

#ADD start-enb.sh /

#ADD config/ /etc/srsran/

#CMD ["/start-enb.sh"]

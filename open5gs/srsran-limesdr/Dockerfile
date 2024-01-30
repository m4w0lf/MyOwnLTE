FROM debian:bullseye-slim AS builder

RUN apt-get update && apt-get install -y \
        git \
		g++ \
		make \
		cmake \
		pkg-config \
		swig \
		libi2c-dev \
		libusb-1.0-0-dev \
		libfftw3-dev \
		libmbedtls-dev \
		libboost-program-options-dev \
		libconfig++-dev \
		libsctp-dev \
		libtalloc-dev \
		libpcsclite-dev \
		libpcap-dev \
		wget \
		autoconf \
		libboost-dev \
		libtool \
		libgnutls28-dev \
		libmnl-dev \
		shtool \
		build-essential

RUN mkdir /tmp/buildroot

WORKDIR /tmp/buildroot

RUN git clone https://github.com/pothosware/SoapySDR.git  && \
	cd SoapySDR && \
	mkdir build && \
	cd build && \
	cmake .. && \
	make -j 4 && \
	make install && \
	ldconfig

RUN git clone https://github.com/myriadrf/LimeSuite.git  && \
	cd LimeSuite && \
	mkdir builddir && \
	cd builddir && \
	cmake .. && \
	make -j 4 && \
	make install && \
	ldconfig 


RUN git clone https://github.com/srsRAN/srsRAN_4G.git && \
	cd srsRAN_4G && \
	mkdir build && \
	cd build && \
	cmake ../ && \
	make && \
	make install && \
	ldconfig


FROM debian:bullseye-slim

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
		screen \
		telnet \
        && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/ /usr/local/

RUN ldconfig

ADD start-enb.sh /

ADD config/ /etc/srsran/

CMD ["/start-enb.sh"]

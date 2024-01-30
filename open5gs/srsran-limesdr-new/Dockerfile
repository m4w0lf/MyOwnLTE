FROM debian:bullseye-slim AS builder

ENV SRSRAN_INSTALL /opt/srsRAN

WORKDIR /tmp

RUN apt-get update && apt-get install -y git python3-distutils

RUN apt-get install -y cmake g++ libpython3-dev python3-numpy swig && \
	git clone --branch soapy-sdr-0.8.1 https://github.com/pothosware/SoapySDR.git && \
	cd SoapySDR && \
	mkdir build && cd build && \
	cmake -DCMAKE_PREFIX_PATH=${SRSRAN_INSTALL} -DCMAKE_INSTALL_PREFIX=${SRSRAN_INSTALL} ..  && \
	make -j`nproc` && make install

RUN apt-get install -y git g++ cmake libsqlite3-dev libi2c-dev libusb-1.0-0-dev libwxgtk3.0-gtk3-dev freeglut3-dev && \
	git clone --branch v22.09.1 https://github.com/myriadrf/LimeSuite.git && \
	cd LimeSuite  && \
	mkdir builddir && cd builddir  && \
	cmake -DCMAKE_PREFIX_PATH=${SRSRAN_INSTALL} -DCMAKE_INSTALL_PREFIX=${SRSRAN_INSTALL} ..  && \
	make -j`nproc` && make install 

RUN apt-get install -y libboost-system-dev libboost-test-dev libboost-thread-dev libqwt-qt5-dev qtbase5-dev && \
	git clone --branch release_2_0_qt5 https://github.com/srsran/srsGUI.git && \
	cd srsGUI && \
	mkdir build && cd build && \
	cmake -DCMAKE_PREFIX_PATH=${SRSRAN_INSTALL} -DCMAKE_INSTALL_PREFIX=${SRSRAN_INSTALL} .. && \
	make -j`nproc` && make install 

RUN apt-get install -y build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev pkg-config && \
	git clone --branch release_23_04 https://github.com/srsran/srsRAN_4G.git && \
	cd srsRAN_4G && \
	mkdir build && cd build && \
	cmake -DCMAKE_PREFIX_PATH=${SRSRAN_INSTALL} -DCMAKE_INSTALL_PREFIX=${SRSRAN_INSTALL} -DUSE_LTE_RATES=ON .. && \
	make -j`nproc` && \
	make install

ADD start-enb.sh /

ADD config/ /etc/srsran/

CMD ["/start-enb.sh"]

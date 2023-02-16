FROM archlinux:base-devel

RUN pacman -Sy --noconfirm boost \
                           cmake \
                           git \
                           postgresql \
                           qt5-base \
                           qt5-multimedia \
                           qt5-svg \
                           qt5-tools \
                           qt5-translations \
                           ttf-dejavu \
                           xerces-c \
                           xalan-c

WORKDIR /brewtarget/
RUN mkdir brewtarget-src
RUN git clone https://github.com/Brewtarget/brewtarget.git --branch v3.0.6 brewtarget-src

WORKDIR /brewtarget/brewtarget-build
RUN cmake ../brewtarget-src
RUN make -j$(nproc)
RUN make install

CMD brewtarget
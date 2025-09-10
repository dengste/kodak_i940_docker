FROM debian:12

COPY ./debs/*.deb .
RUN apt-get update && apt-get install -y --no-install-recommends \
      sane-utils file \
      usbutils libudev0 \
      && dpkg -i *.deb || apt-get install -f -y \
      && rm -rf *.deb /var/lib/apt/lists/*

# Entry point runs scanimage
ENTRYPOINT ["scanimage"]

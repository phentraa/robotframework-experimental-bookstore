FROM mcr.microsoft.com/playwright:focal

USER root
RUN apt-get update -y &&  apt-get install -y python3-pip
COPY src/ app/
RUN chown -R pwuser:pwuser /app

USER pwuser
RUN pip3 install --user robotframework robotframework-browser robotframework-requests python-dotenv

RUN ~/.local/bin/rfbrowser init
ENV NODE_PATH=/usr/lib/node_modules
ENV PATH="/home/pwuser/.local/bin:${PATH}"

WORKDIR /app


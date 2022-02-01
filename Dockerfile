FROM python:3.10

WORKDIR /fishnet
COPY ./stockfish_x86_64-bmi2 /fishnet/stockfish_x86_64-bmi2
COPY ./fishnet.ini /fishnet/fishnet.ini
COPY ./fairyfishnet.py /fishnet/fairyfishnet.py
COPY ./variants.ini /fishnet/variants.ini

RUN pip install fairyfishnet && \
    pip install requests

RUN chmod +x stockfish_x86_64-bmi2
FROM python:3.10

WORKDIR /fishnet
COPY ./stockfish-x86_64-bmi2 /fishnet/stockfish-x86_64-bmi2
COPY ./fishnet.ini /fishnet/fishnet.ini
COPY ./fairyfishnet.py /fishnet/fairyfishnet.py
COPY ./variants.ini /fishnet/variants.ini

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN chmod +x stockfish-x86_64-bmi2
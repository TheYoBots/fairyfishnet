FROM python:3.10

COPY . .
RUN pip install -r requirements.txt

RUN chmod +x stockfish-x86_64-bmi2
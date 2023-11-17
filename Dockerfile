FROM python:latest

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*


COPY /app/firstapp.py /app

COPY requirements.txt /app

RUN pip3 install -r requirements.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "firstapp.py", "--server.port=8501", "--server.address=0.0.0.0"]
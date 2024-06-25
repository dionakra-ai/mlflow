FROM python:3.11.4

EXPOSE 5000

COPY . .

RUN pip install --no-cache -r requirements.txt && \
    mkdir -p /mlflow

CMD mlflow server \
    --host 0.0.0.0 \
    --port 5000 \
    --default-artifact-root ${BUCKET} \
    --backend-store-uri ${CONNECTION_STRING}
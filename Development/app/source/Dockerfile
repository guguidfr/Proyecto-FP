FROM python:latest
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
COPY ./code /app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]

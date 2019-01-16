FROM python:2.7
RUN mkdir /front
WORKDIR /front
COPY . /front

# Add a script to be executed every time the container starts.
EXPOSE 8000

# Start the main process.
CMD ["python", "-m SimpleHTTPServer 8000"]
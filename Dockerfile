FROM nginx

RUN apt-get update \
  && apt-get -y install wget unzip python-pip\
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY default.conf /etc/nginx/conf.d/default.conf

RUN pip install flask

RUN wget https://github.com/prasadrahul/REC_Demo_00/archive/master.zip

RUN unzip master.zip

RUN pip install -r /REC_Demo_00-master/requirements.txt

WORKDIR /REC_Demo_00-master

#CMD ["python", "app.py"]
#RUN python app.py

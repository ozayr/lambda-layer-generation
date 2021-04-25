FROM amazonlinux:2.0.20191016.0


RUN yum install -y python37 && \
    yum install -y python3-pip && \
    yum install -y zip && \
    yum clean all
    
RUN python3.7 -m pip install --upgrade pip && \
    python3.7 -m pip install virtualenv

RUN python3.7 -m venv lambda_layer
 
ARG CACHEBUST  
COPY requirements.txt .
   
RUN source lambda_layer/bin/activate && pip install -r requirements.txt -t ./python && deactivate

RUN zip -r python.zip ./python/



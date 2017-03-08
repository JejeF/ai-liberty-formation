FROM ubuntu:14.04

# get up pip, vim, etc.
RUN apt-get -y update --fix-missing
RUN apt-get install -y python-pip python-dev libev4 libev-dev gcc libxslt-dev libxml2-dev libffi-dev vim curl libfreetype6-dev libpng-dev python-gdal

RUN pip install --upgrade pip

# Install data science python stack
RUN apt-get install -y python-numpy python-scipy
RUN pip install scikit-learn
RUN pip install flask-restful
RUN pip install boto3
RUN pip install jupyter
RUN pip install six==1.6.0
RUN pip install matplotlib
RUN pip install pandas
RUN pip install scikit-image



ENV WORKINF_DIR_NAME working_dir
ENV TINI_VERSION v0.6.0


RUN mkdir /${WORKINF_DIR_NAME}
WORKDIR "/{WORKINF_DIR_NAME}"

# add our project
ADD . /{WORKINF_DIR_NAME}/

EXPOSE 8888

# Lunch jupyter notebook
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]

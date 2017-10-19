FROM amazonlinux

ENV HOME /root

RUN yum update -y
RUN yum groupinstall "Development tools" -y
RUN yum install mlocate -y
RUN yum install openssl-devel -y
RUN yum install bzip2-devel -y
RUN yum install zlib-devel bzip2 bzip2-devel readline-devel sqlite3 sqlite-devel openssl-devel -y

RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv

ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install 3.6.0
RUN pyenv global 3.6.0
RUN pyenv rehash

RUN pip install --upgrade pip
RUN pip install boto3

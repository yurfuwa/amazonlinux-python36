FROM amazonlinux

ENV HOME /root

RUN yum update -y
RUN yum groupinstall "Development tools" -y
RUN yum install mlocate -y
RUN yum install openssl-devel -y
RUN yum install bzip2-devel -y
RUN yum install zlib-devel bzip2 bzip2-devel readline-devel sqlite3 sqlite-devel openssl-devel -y

RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
RUN pyenv install 3.6.0
RUN pyenv global 3.6.0
RUN pyenv rehash

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.bash_profile
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /etc/.bash_profile
RUN echo 'eval "$(pyenv init -)"' >> /etc/.bash_profile

RUN pip install --upgrade pip
RUN pip install boto3

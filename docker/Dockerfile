FROM python:3.7-alpine AS common

RUN mkdir -p /src
WORKDIR /src

RUN pip install virtualenv
ENV VIRTUAL_ENV=/env
RUN python -m virtualenv --system-site-packages --python=/usr/local/bin/python $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

FROM common as deps
RUN apk add alpine-sdk
COPY ./requirements.txt /src/requirements.txt
RUN pip install --prefer-binary --no-cache-dir --requirement /src/requirements.txt

FROM common as final
COPY --from=deps /env /env
RUN echo "source /env/bin/activate" >> /etc/profile
COPY . /src

CMD [ "./docker/docker-entrypoint.sh" ]

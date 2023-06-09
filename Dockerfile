ARG IMAGE=intersystemsdc/iris-community

FROM $IMAGE

WORKDIR /irisdev/app/

RUN --mount=type=bind,src=.,dst=. \
    iris start IRIS && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly
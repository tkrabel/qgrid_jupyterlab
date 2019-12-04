FROM jupyter/scipy-notebook:1386e2046833

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

USER root

COPY data_for_container ${HOME}

USER ${NB_USER}

RUN pip install qgrid
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.0 --no-build && \
    jupyter labextension install @8080labs/qgrid --no-build && \
    jupyter lab build

FROM jupyterhub/k8s-hub:0.10.2

USER root

RUN apt update && apt install nodejs npm -y

COPY jupyterhub/ /opt/jupyterhub
RUN cd /opt/jupyterhub && python3 setup.py bdist_wheel

RUN pip uninstall jupyterhub -y

RUN pip install /opt/jupyterhub/dist/*whl

# remove kubespawner and install kubespawner with user namespace capabilities
RUN pip uninstall jupyterhub-kubespawner -y && \
    pip install git+https://github.com/ucsd-ets/kubespawner.git

USER jovyan

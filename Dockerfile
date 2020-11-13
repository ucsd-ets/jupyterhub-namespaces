FROM jupyterhub/k8s-hub:0.10.2

USER root

# remove kubespawner and install kubespawner with user namespace capabilities
RUN pip uninstall jupyterhub-kubespawner -y && \
    pip install git+https://github.com/ucsd-ets/kubespawner.git

USER jovyan
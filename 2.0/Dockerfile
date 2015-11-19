FROM elasticsearch:2.0

RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.0.2

RUN mkdir /data

# Trust Kubernetes Certificate, used for kubernetes elasticsearch discovery
ENV KUBERNETES_TRUST_CERT true

ENV CLUSTER_NAME default_cluster_name
ENV SERVICE_DNS default_service_dns

ENV KUBERNETES_AUTH_TRYKUBECONFIG true
ENV KUBERNETES_TRUST_CERTIFICATES true
ENV KUBERNETES_AUTH_TRYSERVICEACCOUNT true

ADD kubeconfig /home/elasticsearch/.kube/config
RUN chown -R elasticsearch:elasticsearch /home/elasticsearch

# COPY config/ /usr/share/elasticsearch/config/

CMD ["elasticsearch"]

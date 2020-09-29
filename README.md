# KUBE-POWER-SCHEDULER

Agendamento para escalar replicas up/down kubernetes através de cronjobs.

## Uso

```
git clone https://github.com/swirfneblin/kube-power-schedule
cd kube-power-schedule
```

### Setar contexto do cluster Kubernetes

```
kubectl config set-context CLUSTER_NAME
kustomize build k8s-files/ > deployment.yaml

kubectl apply -f deployment.yaml
```

## Horario fixo dos cronjobs

- scaleDown: 0 06 * * *
- scaleUp: 0 22 * * *

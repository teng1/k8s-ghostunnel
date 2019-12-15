# k8s-ghostunnel

Tunneling TCP/IP traffic through a k8s ingress using ghostunnel 

Setup was on a windows hyperv minikube, with ingress addon enabled 
```
minikube start --memory='8000mb' --cpus=2 --hyperv-virtual-switch='ExternalSwitch' --vm-driver='hyperv'
```
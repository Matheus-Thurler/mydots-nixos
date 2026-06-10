{ config, pkgs, ... }:

{
  services.k3s = {
    enable = false;
    role = "server";
    extraFlags = toString [
      "--disable=traefik"
      "--write-kubeconfig-mode=644"
      "--docker"
      "--node-external-ip=10.0.10.254"
    ];
  };

  networking.firewall.allowedTCPPorts = [
    6443   # k3s API server
    8080   # CloudStack API (hostNetwork)
    8250   # CloudStack Agent (hostNetwork)
    9090   # CloudStack Cluster (hostNetwork)
    30080  # CloudStack UI/API (NodePort)
    30250  # CloudStack Agent comm (NodePort)
  ];

  environment.systemPackages = with pkgs; [
    k3s
    kubectl
    kubernetes-helm
  ];
}

Admin:~/environment $ kubectl get nodes
NAME                          STATUS   ROLES    AGE     VERSION
ip-10-0-57-154.ec2.internal   Ready    <none>   3h32m   v1.30.2-eks-1552ad0
ip-10-0-62-122.ec2.internal   Ready    <none>   3h27m   v1.30.2-eks-1552ad0

Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-57-154.ec2.internal/proxy/configz" | jq -r '.kubeletconfig.cpuManagerPolicy'
static
Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-57-154.ec2.internal/proxy/configz" | jq -r '.kubeletconfig.topologyManagerPolicy'
single-numa-node

Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-62-122.ec2.internal/proxy/configz" | jq -r '.kubeletconfig.cpuManagerPolicy'         
static
Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-62-122.ec2.internal/proxy/configz" | jq -r '.kubeletconfig.topologyManagerPolicy'
single-numa-node

Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-57-154.ec2.internal/proxy/configz" | jq                                              
{
  "kubeletconfig": {
    "enableServer": true,
    "podLogsDir": "/var/log/pods",
    "syncFrequency": "1m0s",
    "fileCheckFrequency": "20s",
    "httpCheckFrequency": "20s",
    "address": "0.0.0.0",
    "port": 10250,
    "tlsCipherSuites": [
      "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256",
      "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
      "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305",
      "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
      "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305",
      "TLS_RSA_WITH_AES_128_GCM_SHA256",
      "TLS_RSA_WITH_AES_256_GCM_SHA384"
    ],
    "serverTLSBootstrap": true,
    "authentication": {
      "x509": {
        "clientCAFile": "/etc/kubernetes/pki/ca.crt"
      },
      "webhook": {
        "enabled": true,
        "cacheTTL": "2m0s"
      },
      "anonymous": {
        "enabled": false
      }
    },
    "authorization": {
      "mode": "Webhook",
      "webhook": {
        "cacheAuthorizedTTL": "5m0s",
        "cacheUnauthorizedTTL": "30s"
      }
    },
    "registryPullQPS": 5,
    "registryBurst": 10,
    "eventRecordQPS": 50,
    "eventBurst": 100,
    "enableDebuggingHandlers": true,
    "healthzPort": 10248,
    "healthzBindAddress": "127.0.0.1",
    "oomScoreAdj": -999,
    "clusterDomain": "cluster.local",
    "clusterDNS": [
      "172.20.0.10"
    ],
    "streamingConnectionIdleTimeout": "4h0m0s",
    "nodeStatusUpdateFrequency": "10s",
    "nodeStatusReportFrequency": "5m0s",
    "nodeLeaseDurationSeconds": 40,
    "imageMinimumGCAge": "2m0s",
    "imageMaximumGCAge": "0s",
    "imageGCHighThresholdPercent": 85,
    "imageGCLowThresholdPercent": 80,
    "volumeStatsAggPeriod": "1m0s",
    "cgroupRoot": "/",
    "cgroupsPerQOS": true,
    "cgroupDriver": "systemd",
    "cpuManagerPolicy": "static",
    "cpuManagerReconcilePeriod": "10s",
    "memoryManagerPolicy": "None",
    "topologyManagerPolicy": "single-numa-node",
    "topologyManagerScope": "container",
    "runtimeRequestTimeout": "2m0s",
    "hairpinMode": "hairpin-veth",
    "maxPods": 737,
    "podPidsLimit": -1,
    "resolvConf": "/etc/resolv.conf",
    "cpuCFSQuota": true,
    "cpuCFSQuotaPeriod": "100ms",
    "nodeStatusMaxImages": 50,
    "maxOpenFiles": 1000000,
    "contentType": "application/vnd.kubernetes.protobuf",
    "kubeAPIQPS": 50,
    "kubeAPIBurst": 100,
    "serializeImagePulls": false,
    "evictionHard": {
      "memory.available": "100Mi",
      "nodefs.available": "10%",
      "nodefs.inodesFree": "5%"
    },
    "evictionPressureTransitionPeriod": "5m0s",
    "enableControllerAttachDetach": true,
    "protectKernelDefaults": true,
    "makeIPTablesUtilChains": true,
    "iptablesMasqueradeBit": 14,
    "iptablesDropBit": 15,
    "featureGates": {
      "RotateKubeletServerCertificate": true
    },
    "failSwapOn": true,
    "memorySwap": {},
    "containerLogMaxSize": "10Mi",
    "containerLogMaxFiles": 5,
    "containerLogMaxWorkers": 1,
    "containerLogMonitorInterval": "10s",
    "configMapAndSecretChangeDetectionStrategy": "Watch",
    "kubeReserved": {
      "cpu": "550m",
      "ephemeral-storage": "1Gi",
      "memory": "8362Mi"
    },
    "systemReservedCgroup": "/system",
    "kubeReservedCgroup": "/runtime",
    "enforceNodeAllocatable": [
      "pods"
    ],
    "volumePluginDir": "/usr/libexec/kubernetes/kubelet-plugins/volume/exec/",
    "providerID": "aws:///us-east-1a/i-0d3ba9c35f51be349",
    "logging": {
      "format": "text",
      "flushFrequency": "5s",
      "verbosity": 2,
      "options": {
        "text": {
          "infoBufferSize": "0"
        },
        "json": {
          "infoBufferSize": "0"
        }
      }
    },
    "enableSystemLogHandler": true,
    "enableSystemLogQuery": false,
    "shutdownGracePeriod": "0s",
    "shutdownGracePeriodCriticalPods": "0s",
    "enableProfilingHandler": true,
    "enableDebugFlagsHandler": true,
    "seccompDefault": false,
    "memoryThrottlingFactor": 0.9,
    "registerNode": true,
    "localStorageCapacityIsolation": true,
    "containerRuntimeEndpoint": "unix:///run/containerd/containerd.sock"
  }
}
Admin:~/environment $ 


Admin:~/environment $ kubectl get --raw "/api/v1/nodes/ip-10-0-62-122.ec2.internal/proxy/configz" | jq                                             
{
  "kubeletconfig": {
    "enableServer": true,
    "podLogsDir": "/var/log/pods",
    "syncFrequency": "1m0s",
    "fileCheckFrequency": "20s",
    "httpCheckFrequency": "20s",
    "address": "0.0.0.0",
    "port": 10250,
    "tlsCipherSuites": [
      "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256",
      "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
      "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305",
      "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
      "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
      "TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305",
      "TLS_RSA_WITH_AES_128_GCM_SHA256",
      "TLS_RSA_WITH_AES_256_GCM_SHA384"
    ],
    "serverTLSBootstrap": true,
    "authentication": {
      "x509": {
        "clientCAFile": "/etc/kubernetes/pki/ca.crt"
      },
      "webhook": {
        "enabled": true,
        "cacheTTL": "2m0s"
      },
      "anonymous": {
        "enabled": false
      }
    },
    "authorization": {
      "mode": "Webhook",
      "webhook": {
        "cacheAuthorizedTTL": "5m0s",
        "cacheUnauthorizedTTL": "30s"
      }
    },
    "registryPullQPS": 5,
    "registryBurst": 10,
    "eventRecordQPS": 50,
    "eventBurst": 100,
    "enableDebuggingHandlers": true,
    "healthzPort": 10248,
    "healthzBindAddress": "127.0.0.1",
    "oomScoreAdj": -999,
    "clusterDomain": "cluster.local",
    "clusterDNS": [
      "172.20.0.10"
    ],
    "streamingConnectionIdleTimeout": "4h0m0s",
    "nodeStatusUpdateFrequency": "10s",
    "nodeStatusReportFrequency": "5m0s",
    "nodeLeaseDurationSeconds": 40,
    "imageMinimumGCAge": "2m0s",
    "imageMaximumGCAge": "0s",
    "imageGCHighThresholdPercent": 85,
    "imageGCLowThresholdPercent": 80,
    "volumeStatsAggPeriod": "1m0s",
    "cgroupRoot": "/",
    "cgroupsPerQOS": true,
    "cgroupDriver": "systemd",
    "cpuManagerPolicy": "static",
    "cpuManagerReconcilePeriod": "10s",
    "memoryManagerPolicy": "None",
    "topologyManagerPolicy": "single-numa-node",
    "topologyManagerScope": "container",
    "runtimeRequestTimeout": "2m0s",
    "hairpinMode": "hairpin-veth",
    "maxPods": 737,
    "podPidsLimit": -1,
    "resolvConf": "/etc/resolv.conf",
    "cpuCFSQuota": true,
    "cpuCFSQuotaPeriod": "100ms",
    "nodeStatusMaxImages": 50,
    "maxOpenFiles": 1000000,
    "contentType": "application/vnd.kubernetes.protobuf",
    "kubeAPIQPS": 50,
    "kubeAPIBurst": 100,
    "serializeImagePulls": false,
    "evictionHard": {
      "memory.available": "100Mi",
      "nodefs.available": "10%",
      "nodefs.inodesFree": "5%"
    },
    "evictionPressureTransitionPeriod": "5m0s",
    "enableControllerAttachDetach": true,
    "protectKernelDefaults": true,
    "makeIPTablesUtilChains": true,
    "iptablesMasqueradeBit": 14,
    "iptablesDropBit": 15,
    "featureGates": {
      "RotateKubeletServerCertificate": true
    },
    "failSwapOn": true,
    "memorySwap": {},
    "containerLogMaxSize": "10Mi",
    "containerLogMaxFiles": 5,
    "containerLogMaxWorkers": 1,
    "containerLogMonitorInterval": "10s",
    "configMapAndSecretChangeDetectionStrategy": "Watch",
    "kubeReserved": {
      "cpu": "550m",
      "ephemeral-storage": "1Gi",
      "memory": "8362Mi"
    },
    "systemReservedCgroup": "/system",
    "kubeReservedCgroup": "/runtime",
    "enforceNodeAllocatable": [
      "pods"
    ],
    "volumePluginDir": "/usr/libexec/kubernetes/kubelet-plugins/volume/exec/",
    "providerID": "aws:///us-east-1a/i-077f4082abbffb441",
    "logging": {
      "format": "text",
      "flushFrequency": "5s",
      "verbosity": 2,
      "options": {
        "text": {
          "infoBufferSize": "0"
        },
        "json": {
          "infoBufferSize": "0"
        }
      }
    },
    "enableSystemLogHandler": true,
    "enableSystemLogQuery": false,
    "shutdownGracePeriod": "0s",
    "shutdownGracePeriodCriticalPods": "0s",
    "enableProfilingHandler": true,
    "enableDebugFlagsHandler": true,
    "seccompDefault": false,
    "memoryThrottlingFactor": 0.9,
    "registerNode": true,
    "localStorageCapacityIsolation": true,
    "containerRuntimeEndpoint": "unix:///run/containerd/containerd.sock"
  }
}
Admin:~/environment $ 

## pod QoS class
Admin:~/environment $ kubectl get pod pod1-dr1-net1-vlan100 -o jsonpath="{ .status.qosClass }"
Guaranteed
Admin:~/environment $ 

## worker node pod cpu bind
sh-5.2$ sudo cat /var/lib/kubelet/cpu_manager_state | jq                                                                                     
{
  "policyName": "static",
  "defaultCpuSet": "0,2-47,50-95,97-143,145-191",
  "entries": {
    "07348c4c-8d90-4303-a162-b6c2040fd184": {
      "ubuntu-frr": "48"
    },
    "2b7f6116-12e4-4453-9e60-d28bc2f9ad09": {
      "ubuntu-netutils": "144"
    },
    "30c78fd5-4bbd-41a8-ad05-655f4b4eeb9b": {
      "ubuntu-netutils": "96"
    },
    "8fafa644-09a4-4342-8ad5-c01b64b75daf": {
      "ubuntu-netutils": "49"
    },
    "a8a42ad9-e6ac-45c3-99ec-a8a623e037d2": {
      "ubuntu-netutils": "1"
    }
  },
  "checksum": 1885545006
}
sh-5.2$ 

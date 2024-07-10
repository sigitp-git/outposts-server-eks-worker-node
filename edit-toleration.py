#!/bin/env python3

import subprocess
import json
import argparse

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-n', '--namespace', required=True, help='Namespace for pods to work on. Use `all` if you want to work on all pods.')
    args = vars(ap.parse_args())

    pods = getPods(args['namespace'])

    for pod in pods['items']:
        podName = pod['metadata']['name']
        podNamespace = pod['metadata']['namespace']
        newTolerations = editTolerations(pod['spec']['tolerations'])
        if not newTolerations:
            print(f'No changes needed for {podName} pod in {podNamespace} namespace')
            continue
        patchPods(podName, podNamespace, json.dumps(newTolerations))

def getPods(namespace):
    command = ['kubectl', 'get', 'pods','-o', 'json']
    if namespace == 'all':
        command.append('-A')
    else:
        command.extend(['-n', namespace])
    print(f'Getting pods for {namespace} namespace')
    return json.loads(execKubectl(command))

def patchPods(podName, podNamspace, podTolerations):
    kubectlPatch = f'{{"spec":{{"tolerations":{podTolerations}}}}}'
    command = ['kubectl', 'patch', 'pod', podName, '-n', podNamspace, '--type=merge', '--patch', kubectlPatch]
    print(f'Patching {podName} pod in {podNamspace} namespace')
    execKubectl(command)

def editTolerations(tolerations):
    modifyCount = 0
    for toleration in tolerations:
        if 'key' in toleration:
            if toleration['key'] == 'node.kubernetes.io/unreachable':
                if 'tolerationSeconds' in toleration:
                    del toleration['tolerationSeconds']
                    modifyCount += 1
    if modifyCount == 0:
        return []
    return tolerations

def execKubectl(command):
    commandExecution = subprocess.run(command, capture_output=True, text=True)
    if commandExecution.returncode != 0:
        raise Exception(f"Error: {commandExecution.stderr}")
    return commandExecution.stdout

if __name__ == '__main__':
    main()

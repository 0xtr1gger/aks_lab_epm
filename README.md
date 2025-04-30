
1. Generate SSH keys and copy the public key to the `./terraform/aks_root/ssh_keys` directory:

```bash
ssh-keygen -t rsa -b 4096
```

```bash
cp ~/.ssh/id_rsa.pub ./terraform/aks_root/ssh_keys
```

2. Provision resources:

```bash
cd terraform/aks_root
```

```bash
terraform apply
```

3. Ensure the cluster and ontainer registry were created successfully using the following Azure CLI command:

```bash
az aks list \
	--resource-group $RG_NAME \
	--query "[].{\"K8s cluster name\":name}" \
    --output table
```

- Where `$RG_NAME` is the name of your resource group:

```bash
export RG_NAME=$(terraform output -raw resource_group_name)
```

4. Save Kubernetes cluster configuration to a local file:

```bash
echo "$(terraform output -raw kube_config)" > ./aks_config
```
5. Set the `KUBECONFIG` environment variable:

```bash
export KUBECONFIG=$(realpath ./aks_config)
```

6. Verify `kubectl` works properly:

```bash
kubectl get nodes
```

7. Save the name of the ACR:

```bash
export ACR_NAME=$(terraform output -raw acr_name) 
```

8. Save the domain name of the ACR:

```bash
export ACR_DOMAIN=$(az acr show --name $ACR_NAME --query "loginServer" --output tsv)
```

9. Create a new Kubernetes secret:

```bash
kubectl create secret docker-registry acr-secret \
--docker-server=$ACR_DOMAIN \
--docker-username=<ACR_USERNAME> \
--docker-password=<ACR_PASSWORD>
--docker-email=<YOU_EMAIL>
```

10. Authenticate to ACR:

```bash
az acr login --name $ACR_NAME
# az acr login --name acrlabepm.azurecr.io
```

11. Tag your Docker image:

```bash
# docker tag <localImageName> <acrLoginServer>/<imageName>:<tag>

docker tag greetings_app acrlabepm.azurecr.io/greetings_app:v0.1
```

12. Push image to the registry:

```bash
docker push acrlabepm.azurecr.io/greetings_app:v0.1
```

13. Verify the upload:

```bash
az acr repository list --name $ACR_NAME --output table
```

![get_svc_aks_epm](https://github.com/user-attachments/assets/cecf16cb-2f35-491a-9ab0-820963bad211)
![kubectl_get_all_aks_epm](https://github.com/user-attachments/assets/7c00e6f3-4a06-44ed-9410-70d817d51c3a)
![websiite_aks_epm](https://github.com/user-attachments/assets/64e11c5c-1671-4134-bed3-f4cf04e02331)

# staging-environments-example 

This is a small demo showing how [Helm](https://helm.sh/) can be used to simplify Kubernetes deployment process.
You can read more about it in this [post](ADDO talk or link to post/).

## Demo Structure

This deployment is done using a single `values.yaml` file, without all the ugly and messy Kubernetes files.
By using these files, I can use a generic helm chart to deploy each one of these APIs.

## Running the demo

To install, use this command -
helm install --dry-run --debug --name staging-deployment --set image.name=terta ./staging-environments-example

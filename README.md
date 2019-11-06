# staging-environments-example 

This is a small demo showing how [Helm](https://helm.sh/) can be used to simplify Kubernetes deployment process.

## Demo Structure

This deployment is done using a single `values.yaml` file.

## Running the demo

To install, use this command -
helm install --dry-run --debug --name staging-deployment --set image.name=terta ./staging-environments-example

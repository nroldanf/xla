
## Set up environment

```bash
conda env create -f conda.yaml
```

```bash
conda env update --file conda.yaml --prune
```

### Deploying mlflow locally

```bash
mlflow server --backend-store-uri sqlite:///mlflow.db --default-artifact-root ./mlruns
```
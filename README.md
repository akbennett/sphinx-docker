# Simple sphinx --> pdf compiler

## usage

```
sudo docker run -i -t -v $PWD:/root/output -e "REPO=https://github.com/akbennett/devicetree-specification" akbennett/sphinx-docker
```

If the sphinx build was successful, the PDF version of the project documentation will then be in your local directory under ./sphinx-build

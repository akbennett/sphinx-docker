# Simple sphinx --> pdf compiler

## usage

```
sudo docker run -i -t -v $PWD:/root/output -e "REPO=https://github.com/akbennett/rst-specification" akbennett/sphinx-docker
```

If the sphinx build was successful, the PDF version of the project documentation will then be in your local directory under ./sphinx-build

To use the container on a working directory, simply map the local directory into the container and compile and develop on the shared volume
```
git clone https://github.com/akbennett/rst-specification workingdir
cd workingdir
sudo docker run -i -t -v $PWD:/build akbennett/sphinx-docker
--> in container
cd build
make latexpdf
...
```

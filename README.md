# Simple sphinx --> pdf compiler

## usage

'''
sudo docker run -i -t -v $PWD:/root/output -e "REPO=https://github.com/akbennett/devicetree-specification" akbennett/sphinx-docker
'''

PDF version of the project documentation will then be in your local directory under ./sphinx-build

set -e -u

version=$1

wget https://github.com/prometheus/prometheus/releases/download/v$(version)/prometheus-$(version).linux-amd64.tar.gz
tar xzf prometheus-$(version).linux-amd64.tar.gz
cd prometheus-$(version).linux-amd64

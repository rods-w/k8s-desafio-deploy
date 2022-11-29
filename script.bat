echo "Criando as imagens..."

docker build -t rodolfowanderley/projeto-backend:1.0 backend/.
docker build -t rodolfowanderley/projeto-database:1.0 database/.

echo "Realizando Push das imagens..."

docker push rodolfowanderley/projeto-backend:1.0
docker push rodolfowanderley/projeto-database:1.0

echo "Criando Serviços no Cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml

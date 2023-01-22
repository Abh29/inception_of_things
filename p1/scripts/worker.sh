sudo apt update

## args: server_ip worker_ip token_file

echo "args: $1, $2, $3"

curl -sfL https://get.k3s.io | sh -s - agent \
	--token-file "$3" \
	--server "https://$1:6443" \
	--node-ip "$2"

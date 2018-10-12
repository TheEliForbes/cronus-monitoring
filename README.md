# TIKsm-setup
A series of bash scripts to prime a fresh Ubuntu 16.04 host for Telegraf, and InfluxDB.

1. Sudo ./dockerKube.bash
	a. You might have to run this twice if kube installs are screwy
  
1.5. Join the new Host to the Cluster
	i. Some notes on joining nodes to the master exist here https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
		a. Go to your Master Node
			a. You may need to wipe your kubeadm
				- sudo kubeadm reset
			b. Probably must turn off swap
				- sudo swapoff -a
			c. Join the node to master
				- kubeadm join 10.0.0.1:6443 --token <token> --discovery-token-ca-cert-hash sha256:<hash>
					- If you don't have your token, on master,
						- sudo kubeadm token list
						- Find an active token
							- If all are expired,
							- sudo kubeadm token create
          - If you don't have your cert-hash, I can't help you there yet..

2. Install 'dep' from binary
	a. https://golang.github.io/dep/docs/installation.html
	b. su root
	c. password
	d. sudo curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
	e. Exit
3. Sudo ./tikInstall.bash
4. Configure Telegraf
	a. In the outputs.influxdb section,
		a. Uncomment the following lines
			urls (only 8086), database, skip_database_creation, retention_policy, write_consistency, timout.
	b. In the inputs.prometheus section,
		a. Uncomment urls line if commented out
		b. Modify urls in the array
		urls = ["http://10.111.251.5:8080/metrics", "http://10.111.251.5:8081/metrics"]
5. Start Telegraf
	a. telegraf --config telegraf.conf &
6. Check out the data in InfluxDB
	a. influx
	b. use telegraf
	c. show series

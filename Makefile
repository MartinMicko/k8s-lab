up-baseline:

	kind create cluster --config baseline/cluster.yml

	kubectl apply -f manifests/ --context kind-baseline



up-cilium:

	kind create cluster --config cilium/cluster.yml

	cilium install --context kind-cilium

	cilium status --wait --context kind-cilium

	kubectl apply -f manifests/ --context kind-cilium



down-baseline:

	kind delete cluster --name baseline



down-cilium:

	kind delete cluster --name cilium

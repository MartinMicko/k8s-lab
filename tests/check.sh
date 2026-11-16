#!/bin/bash

CTX=${1:-kind-cilium}

t() {

  code=$(kubectl --context "$CTX" exec -n "$2" "$3" -- curl -s -o /dev/null -w "%{http_code}" --max-time 3 "$4" 2>/dev/null)

  printf "%-22s %s\n" "$1" "${code:-000}"

}

t "frontend -> backend" demo deploy/frontend http://backend.demo.svc

t "backend  -> db"      demo deploy/backend  http://db.demo.svc

t "frontend -> db"      demo deploy/frontend http://db.demo.svc

t "attacker -> backend" other attacker       http://backend.demo.svc

#!/bin/bash
wicm=localhost:12891

#curl -X DELETE  ${wicm}/reset_db

curl -X POST ${wicm}/nap \
    -H "Content-type: application/json"  \
    -d'{"nap":{"mkt_id":"nap1","client_mkt_id":"nap1","switch":"openflow:1","ce_port":1,"pe_port":2,"ce_transport":{"type":"vlan","vlan_id":300},"pe_transport":{"type":"vlan","vlan_id":300}}}'


curl -X POST ${wicm}/nfvi \
    -H "Content-type: application/json"  \
    -d '{"nfvi":{"mkt_id":"nfvi1","switch":"openflow:1","ce_port":3,"pe_port":3}}'


curl -X POST ${wicm}/nfvi \
    -H "Content-type: application/json"  \
    -d '{"nfvi":{"mkt_id":"nfvi2","switch":"openflow:2","ce_port":2,"pe_port":2}}'

curl -X POST ${wicm}/vnf-connectivity \
    -H "Content-type: application/json" \
    -d'{"service":{"ns_instance_id":"service1","client_mkt_id":"nap1","nap_mkt_id":"nap1","nfvi_mkt_id":["nfvi1","nfvi2"]}}'

curl -X PUT ${wicm}/vnf-connectivity/service1 
#curl -X DELETE ${wicm}/vnf-connectivity/service1

curl -X POST ${wicm}/vnf-connectivity \
    -H "Content-type: application/json" \
    -d'{"service":{"ns_instance_id":"service1","client_mkt_id":"nap1","nap_mkt_id":"nap1","nfvi_mkt_id":["nfvi1","nfvi2","nfvi1","nfvi2"]}}'

curl -X PUT ${wicm}/vnf-connectivity/service1 
#curl -X DELETE ${wicm}/vnf-connectivity/service1 

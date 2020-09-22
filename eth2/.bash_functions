function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}

prom () { sudo systemctl daemon-reload && sudo systemctl $1 prometheus.service --no-pager; }
beacon () { sudo systemctl daemon-reload && sudo systemctl $1 beacon-chain.service --no-pager; }
validator () { sudo systemctl daemon-reload && sudo systemctl $1 validator.service --no-pager; }
slasher () { sudo systemctl daemon-reload && sudo systemctl $1 slasher.service --no-pager; }
geth () { sudo systemctl daemon-reload && sudo systemctl $1 geth.service --no-pager; }
grafana () { sudo systemctl daemon-reload && sudo systemctl $1 grafana-server.service --no-pager; }
node_exporter () { sudo systemctl daemon-reload && sudo systemctl $1 node_exporter.service --no-pager; }
blackbox_exporter () { sudo systemctl daemon-reload && sudo systemctl $1 blackbox_exporter.service --no-pager; }
monitoring () {
    sudo systemctl daemon-reload
    sudo systemctl $1 prometheus.service
    sudo systemctl $1 grafana-server.service
    sudo systemctl $1 node_exporter.service
    sudo systemctl $1 blackbox_exporter.service 
}

logs () { sudo journalctl -u $1 -f; }

nimbus () { sudo systemctl daemon-reload && sudo systemctl $1 nimbus.service --no-pager; }
lodebeacon () { sudo systemctl daemon-reload && sudo systemctl $1 lodestar-beacon.service --no-pager; }
lodevalidator () { sudo systemctl daemon-reload && sudo systemctl $1 lodestar-validator.service --no-pager; }
# Modified to work with MacOS 10.15.4 and preinstalled Kustomize and Kuberctl in /usr/local/bin.
#!/bin/bash

# Common variables
#readonly KUSTOMIZE_PATH="${PKGDIR}/bin/kustomize"
readonly KUSTOMIZE_PATH="/tmp/kustomize"
readonly VERBOSITY="${GCE_PD_VERBOSITY:-2}"
#readonly KUBECTL="${GCE_PD_KUBECTL:-kubectl}"
readonly KUBECTL="/tmp/kubectl"
# Common functions

function ensure_var(){
    if [[ -z "${!1:-}" ]];
    then
        echo "${1} is unset"
        exit 1
    else
        echo "${1} is ${!1}"
    fi
}

function get_needed_roles()
{
	echo "roles/compute.storageAdmin roles/iam.serviceAccountUser projects/${PROJECT}/roles/gcp_compute_persistent_disk_csi_driver_custom_role"
}

# Installs kustomize in ${PKGDIR}/bin
function ensure_kustomize()
{
  ensure_var PKGDIR
#  "${PKGDIR}/deploy/kubernetes/install-kustomize.sh" # already installed by cluster.sh. so skipping it here.
}

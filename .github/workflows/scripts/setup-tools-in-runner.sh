#!/bin/bash
set -e

# Desired versions
DESIRED_HELM_VERSION="v3.16.3"
DESIRED_HELMFILE_VERSION="0.167.1"

# Ensure ~/.local/bin exists and is at the front of PATH
mkdir -p "$HOME/.local/bin"
# export PATH="$HOME/.local/bin:$PATH"

# Install Helm if missing or wrong version
if ! command -v helm &>/dev/null || ! (helm version --short | grep -q "$DESIRED_HELM_VERSION"); then
echo "Installing Helm $DESIRED_HELM_VERSION..."
curl -LO "https://get.helm.sh/helm-${DESIRED_HELM_VERSION}-linux-amd64.tar.gz"
tar -zxvf "helm-${DESIRED_HELM_VERSION}-linux-amd64.tar.gz"
mv linux-amd64/helm "$HOME/.local/bin/helm"
chmod +x "$HOME/.local/bin/helm"
rm -rf linux-amd64 "helm-${DESIRED_HELM_VERSION}-linux-amd64.tar.gz"
else
echo "Helm $DESIRED_HELM_VERSION is already installed at $(command -v helm). Skipping."
fi
echo "Helm version: $(helm version --short)"

echo "----------------------"

# Install Helmfile if missing or wrong version
if ! command -v helmfile &>/dev/null || ! (helmfile --version | grep -q "$DESIRED_HELMFILE_VERSION"); then
echo "Installing Helmfile $DESIRED_HELMFILE_VERSION..."
curl -SL -o /tmp/helmfile.tar.gz "https://github.com/helmfile/helmfile/releases/download/v${DESIRED_HELMFILE_VERSION}/helmfile_${DESIRED_HELMFILE_VERSION}_linux_amd64.tar.gz"
tar -zxvf /tmp/helmfile.tar.gz -C /tmp/
mv /tmp/helmfile "$HOME/.local/bin/helmfile"
chmod +x "$HOME/.local/bin/helmfile"
echo "Running helmfile init to install plugins..."
helmfile init --force
else
echo "Helmfile $DESIRED_HELMFILE_VERSION is already installed at $(command -v helmfile). Skipping."
fi
echo "$(helmfile --version)"
echo "Helm diff version: $(helm diff version)"

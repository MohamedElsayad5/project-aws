#!/bin/bash
set -euo pipefail

echo "📦 installing ArgoCD..."
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "⏳ waiting for ArgoCD server to be available..."
kubectl wait --for=condition=available \
  deployment/argocd-server \
  -n argocd \
  --timeout=300s

echo "🔑 Argocd admin password:"
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d && echo

echo "🚀 applying ArgoCD applications..."
kubectl apply -f argocd/projects/graduation-project.yaml
kubectl apply -f argocd/apps/app-of-apps.yaml

echo "✅ ArgoCD is installed and App of Apps is deployed!"
echo "🌐 للوصول: kubectl port-forward svc/argocd-server -n argocd 8080:443"
# TEST-Copilot-Bot

Ce repository est géré par un agent Copilot automatisé.

## Instructions de l'agent

> ⚠️ **L'agent doit impérativement lire le fichier [`instructions.md`](./instructions.md) pour connaître ses directives.**

Toutes les instructions de comportement de l'agent sont définies dans [`instructions.md`](./instructions.md).
Ce fichier n'est pas modifiable par l'agent.

## Commandes supportées

### `create-item`

Crée une nouvelle entrée FAQ. Deux modes d'utilisation sont disponibles :

#### Via l'API GitHub (GitHub Actions `workflow_dispatch`)

Déclenche le workflow [`create-item`](.github/workflows/create-item.yml) depuis l'interface GitHub ou via l'API :

```bash
gh workflow run create-item.yml \
  --field title="Ma question ?" \
  --field answer="La réponse." \
  --field slack_thread_ts="1743670223.000000"
```

Ou via l'API REST GitHub :

```bash
curl -X POST \
  -H "Authorization: Bearer <TOKEN>" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/JulienL79/TEST-Copilot-Bot/actions/workflows/create-item.yml/dispatches \
  -d '{
    "ref": "main",
    "inputs": {
      "title": "Ma question ?",
      "answer": "La réponse.",
      "slack_thread_ts": "1743670223.000000"
    }
  }'
```

Le workflow crée automatiquement le fichier FAQ, une branche `add_<slug>` et ouvre une Pull Request vers `main`.

#### Via le script CLI local

```bash
./create-item.sh \
  --title "Ma question ?" \
  --answer "La réponse." \
  --slack-ts "1743670223.000000"
```

**Options :**

| Option | Requis | Description |
|--------|--------|-------------|
| `--title` | ✅ | Titre / question de l'entrée FAQ |
| `--answer` | ✅ | Corps de la réponse |
| `--slack-ts` | ❌ | Horodatage du thread Slack d'origine |

#### Via l'agent Copilot (Slack)

L'agent Copilot lit le thread Slack complet et :
1. Génère un fichier Markdown structuré
2. Crée une branche `add_<slug>` et ouvre une Pull Request vers `main`

### `update-item`

Met à jour une entrée FAQ existante à partir d'un thread Slack. L'agent :
1. Lit le thread Slack complet
2. Récupère les réponses marquées avec la réaction `:pencil2:`
3. Met à jour la section `Answer` et le champ `updated_at` du fichier Markdown correspondant
4. Crée une nouvelle branche `update_<slug>` et ouvre une nouvelle Pull Request vers `main`

> Pour chaque commande, l'agent se réfère aux instructions détaillées dans [`instructions.md`](./instructions.md).

## Structure des fichiers FAQ

Chaque entrée FAQ est un fichier Markdown avec le format suivant :

```markdown
---
slack_thread_ts: <horodatage du thread Slack>
title: <titre de la question>
created_at: <date de création ISO>
updated_at: <date de mise à jour ISO>
---

## Question
<titre reformulé>

## Answer
<réponse synthétisée>
```

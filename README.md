# TEST-Copilot-Bot

Ce repository est géré par un agent Copilot automatisé.

## Instructions de l'agent

> ⚠️ **L'agent doit impérativement lire le fichier [`instructions.md`](./instructions.md) pour connaître ses directives.**

Toutes les instructions de comportement de l'agent sont définies dans [`instructions.md`](./instructions.md).

## Commandes supportées

### `create-faq`

Crée une nouvelle entrée FAQ à partir d'un thread Slack. L'agent :
1. Lit le thread Slack complet
2. Génère un fichier Markdown structuré
3. Crée une branche `add_<slug>` et ouvre une Pull Request vers `main`

### `update-faq`

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

# Instructions Copilot — Agent FAQ

> Ce fichier configure le comportement de l'agent Copilot pour ce repository.
> **L'agent doit lire [`instructions.md`](../instructions.md) en priorité avant d'exécuter toute commande.**

---

## Rôle de l'agent

Cet agent gère une base de connaissances FAQ à partir de threads Slack. Il crée et met à jour des fichiers Markdown structurés dans ce repository.

---

## Commandes supportées

### `create-faq`

**Point d'entrée :** L'utilisateur envoie la commande `create-faq` à l'agent Copilot dans un thread Slack.

**Flux de données :**
1. L'agent lit le thread Slack complet via l'API Slack
2. Il identifie les réponses marquées avec la réaction `:approved-stamp:`
3. Il génère un fichier Markdown (`<slug>.md`) avec les métadonnées YAML et les sections `Question` / `Answer`
4. Il crée une branche `add_<slug>` et ouvre une Pull Request vers `main`
5. Il répond dans le thread Slack avec le lien de la PR

**Instructions détaillées :** voir [`instructions.md`](../instructions.md) — section `create-faq`

---

### `update-faq`

**Point d'entrée :** L'utilisateur envoie la commande `update-faq` à l'agent Copilot dans un thread Slack.

**Flux de données :**
1. L'agent lit le thread Slack complet via l'API Slack
2. Il identifie les réponses marquées avec la réaction `:pencil2:`
3. Il construit un nouvel `Answer` en concaténant et reformulant ces réponses
4. Il localise le fichier Markdown existant correspondant au titre du thread (même règle de nommage : slug)
5. Il met à jour la section `## Answer` et le champ `updated_at` dans le fichier existant
6. Il crée une **nouvelle** branche `update_<slug>` (sans réutiliser l'ancienne branche)
7. Il commit les modifications et ouvre une **nouvelle** Pull Request vers `main`
8. Il répond dans le thread Slack avec le lien de la PR et un résumé des changements

**Instructions détaillées :** voir [`instructions.md`](../instructions.md) — section `update-faq`

---

## Structure des fichiers FAQ

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

---

## Règles de nommage

| Élément | Convention |
|---------|------------|
| Nom de fichier | `slug_du_titre.md` (lowercase, espaces → `_`) |
| Branche création | `add_<slug>` |
| Branche mise à jour | `update_<slug>` |
| Branche cible PR | `main` |

# Instructions de l'agent Copilot

> Ce fichier contient toutes les directives que l'agent Copilot doit suivre.
> **L'agent doit lire ce fichier en priorité avant d'exécuter toute commande.**

---

## Quand tu reçois l'instruction "create-item" tu dois :

1. Lire le thread Slack complet
2. Définir :
   - Title = message initial du thread (en reformulant plus proprement la question au besoin)
   - slack_thread_ts = message_ts du message initial
   - created_at = message_ts du message initial au format Date ISO
   - updated_at = message_ts du message initial au format Date ISO

3. Récupérer uniquement les réponses ayant la réaction :approved-stamp:
4. Construire "Answer" :
   - concaténer ces réponses
   - reformuler en une réponse claire, structurée et synthétique

5. Générer un fichier Markdown avec ce format :

```
---
slack_thread_ts: <slack_thread_ts>
title: <Title>
created_at: <created_at>
updated_at: <updated_at>
---

## Question
<Title>

## Answer
<Answer>
```

6. Nom du fichier :
   - slug du Title (lowercase, espaces remplacés par "_")
   - extension .md

7. Créer une branche :
   - "add_" + slug du Title

8. Ajouter le fichier dans le repository

9. Ouvrir une Pull Request vers la branche main

10. Répondre dans le thread Slack avec :
   - le lien du PR
   - un résumé des changements

---

## Quand tu reçois l'instruction "update-item" tu dois :

1. Lire le thread Slack complet
2. Définir :
   - updated_at = date de l'instant présent (new Date()) au format ISO

3. Récupérer uniquement les réponses avec la réaction :pencil2:

4. Construire un NOUVEL "Answer" :
   - concaténer ces réponses
   - reformuler proprement

5. Trouver le fichier Markdown existant correspondant au Title :
   - même règle de nommage (slug)

6. Modifier :
   - section Answer
   - champ updated_at (date actuelle)

7. Créer une NOUVELLE branche :
   - "update_" + slug du Title
   - ne pas utiliser la branche existante de la PR précédente

8. Commit les changements

9. Ouvrir une NOUVELLE Pull Request vers main
  - ne pas mettre à jour l'ancienne PR

10. Répondre dans le thread Slack avec :
   - le lien du PR
   - un résumé des changements

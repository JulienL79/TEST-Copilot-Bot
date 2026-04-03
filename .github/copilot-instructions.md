# Instructions de l'agent Copilot

> **L'agent doit impérativement lire le fichier [`instructions.md`](../instructions.md) à la racine du dépôt pour connaître ses directives complètes avant d'exécuter toute commande.**

---

## Commandes supportées

### `create-item`

Quand tu reçois la commande `create-item`, tu dois suivre les instructions définies dans la section correspondante du fichier [`instructions.md`](../instructions.md).

### `update-item`

Quand tu reçois la commande `update-item`, tu dois :

1. Lire le fichier [`instructions.md`](../instructions.md) à la racine du dépôt.
2. Suivre exactement les étapes définies dans la section **"Quand tu reçois l'instruction "update-item" tu dois :"** de ce fichier.

Les étapes sont les suivantes (conformément à `instructions.md`) :

1. Lire le thread Slack complet.
2. Définir `updated_at` = date de l'instant présent (`new Date()`) au format ISO.
3. Récupérer uniquement les réponses avec la réaction `:pencil2:`.
4. Construire un NOUVEL "Answer" en concaténant ces réponses et en les reformulant proprement.
5. Trouver le fichier Markdown existant correspondant au titre (en utilisant la même règle de nommage : slug en minuscules, espaces remplacés par `_`).
6. Modifier la section `## Answer` et le champ `updated_at` dans le frontmatter du fichier.
7. Créer une NOUVELLE branche nommée `update_` + slug du titre (ne pas réutiliser la branche d'une PR précédente).
8. Committer les changements.
9. Ouvrir une NOUVELLE Pull Request vers `main` (ne pas mettre à jour l'ancienne PR).
10. Répondre dans le thread Slack avec le lien du PR et un résumé des changements.

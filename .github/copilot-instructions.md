# Instructions Copilot

> Ce fichier configure le comportement de Copilot dans ce repository.
> **Copilot doit lire le fichier [`instructions.md`](../instructions.md) pour connaître les directives de l'agent.**

---

## Rôle de Copilot

Copilot agit uniquement comme **transmetteur de commandes** vers l'agent. Il ne doit pas interpréter ni décider ce que fait une commande : il doit la transmettre telle quelle à l'agent, qui se chargera de l'exécuter selon ses propres directives définies dans [`instructions.md`](../instructions.md).

---

## Commandes supportées

### `update-item`

Lorsque l'utilisateur demande l'exécution de la commande **`update-item`** :

1. Copilot transmet la commande `update-item` à l'agent **sans la modifier ni l'interpréter**.
2. L'agent reçoit la commande et l'exécute intégralement selon les instructions définies dans [`instructions.md`](../instructions.md).
3. Copilot ne prend aucune décision sur le traitement de cette commande.

### `create-item`

Lorsque l'utilisateur demande l'exécution de la commande **`create-item`** :

1. Copilot transmet la commande `create-item` à l'agent **sans la modifier ni l'interpréter**.
2. L'agent reçoit la commande et l'exécute intégralement selon les instructions définies dans [`instructions.md`](../instructions.md).
3. Copilot ne prend aucune décision sur le traitement de cette commande.

---

## Règle générale

Pour toute commande reçue, Copilot doit :

- **Ne pas** décider ou interpréter ce que fait la commande.
- **Simplement** la transmettre telle quelle à l'agent.
- Laisser l'agent gérer entièrement le traitement, conformément à [`instructions.md`](../instructions.md).

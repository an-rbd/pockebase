# README

## Configuration des adresses IP

⚠️ **Action obligatoire avant exécution**

L’utilisateur doit **modifier les adresses IP des 3 machines** utilisées par le projet **dans tous les fichiers `.sh`**.

Les scripts shell contiennent des adresses IP codées en dur. Si elles ne correspondent pas à votre environnement, le projet **ne fonctionnera pas correctement**.

---

## Étapes à suivre

1. Ouvrez le projet dans votre éditeur de texte ou IDE.
2. Recherchez toutes les occurrences d’adresses IP dans les fichiers `.sh`.
3. Remplacez-les par les IP correspondant à vos **trois machines**.
4. Enregistrez les modifications.

---

## Exemple

Avant :

```bash
SERVER_IP="192.168.1.10"
```

Après :

```bash
SERVER_IP="10.0.0.5"
```

---

## Vérification

Après modification, assurez-vous que :

* Les **3 IP sont correctes** et accessibles
* Aucun ancien IP n’est encore présent dans les fichiers `.sh`


## Support

Si le projet ne fonctionne pas après modification des IP :

* Vérifiez les droits d’exécution des scripts (`chmod +x *.sh`)

---

✅ Une fois les IP correctement configurées, vous pouvez exécuter le script **auto.sh** .

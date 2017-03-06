# AI Liberty Formation

Notebooks et slides servant au différentes présentations et interventions sur le machine learning réalisé par l'équipe de datascience de Liberty-Rider.

Liste des événements éffectués et à venir :
- présentation technique à AtHome, 10 janvier, Toulouse
- connecteDriver conférence, 1-2 Février 2017, Bruxelles
- meetup voiture connectée, 16 Février 2017,  Paris
- intervention à Epitech, 8 Mars 2017, Toulouse


## Présenation du repository

Ce repository contient:
- les slides de la présentation
- un dockerfile
- les notebook python des différents projets
- un repertoire dataset contenat les data


## Présentation (slides)

https://drive.google.com/open?id=1KUkX3YBGJ-JLqRe45SV2AlWLxYJhun-gShUu3g2Ezk4

## Data-Science repo Setup

#### Installer Docker

Pour ça je vous renvoie vers la page d'installation de Docker: https://docs.docker.com/engine/installation/
Pas besoin d'être un expert en Docker, le dockerfile proposé est bien construit, tout se lancera automatiquement !

#### Construire l'image

Il d'abord cloner ce repo GitHub.
Il suffit de lancer la commande à la racine du projet:

```bash
docker build --force-rm=true -t jupyter .
```

**Etapes**:
Cette commande lance la construction de l'image :
 - Elle part de l'image officielle Ubuntu14.04
 - On y installe la stack data-science de python (numpy, pandas, matplotlib, sklearn, ...)
 - On choisit `/work_dir/` comme répertoire de travail
 - Enfin on ajoute un script bash qui lancera automatiquement Jupyter

#### Lancer le container

Placez-vous à la racine du projet et lancez :

```bash
docker run -p 8888:8888 jupyter
```

Vous pouvez directement aller dans votre navigateur Internet : `localhost:8888/`


Et voilà, vous avez un environement de dévellopement de data-science tout installé !

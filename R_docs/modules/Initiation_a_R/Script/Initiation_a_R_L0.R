
## Prise en main avec R et RSudio 


# un exemple de commentaire


#afficher les objects de l'environnement de travail
ls()

#Supprimmer un objet dans l'environmnt de travail

x = 1 # on crée l'objet x

rm(x)

#supprimer tous les elements de l'environment de travail
x = 1
y = 2

rm(list = ls())

# supprimer une liste donnée d'objet
x=1 ;y=1; z=1 # on  crée 3 objet , y et z

rm(list = c("x","y"))

#afficher tous les fichiers du répertoire de travail

list.files()

#afficher le chemin du répertoire de travail

getwd()# get working directory

#vérifier si un fichier onné existe dans le repertoire de travail
file.exists("amsa.csv") 
# TRUE= ça existe et FALSE=ça n'existe pas

write.csv(mtcars,"amsa.csv") # on crée un fichier csv dans le repertoire de travail

file.exists("amsa.csv") # TRUE= ça existe et FALSE=ça n'existe pas

# lister les fichiers du répertoire selon un modèle (pattern)
list.files(pattern = ".csv")

#supprimer un ficher à partir de R
file.remove("amsa.csv")

list.files() # on ne voit plus le fichier csv

#Creer un dossier avec R
dir.create("My_dir")

# vérifier si un dossier donné existe dans le répertoire de travail
dir.exists("My_dir")

#supprimer un dossier avec R
unlink("My_dir", recursive = TRUE)

#obtenir de l'aide sur une comande  sur R exemple la commande write.csv()
?write.csv # sans les parenthèses
# ou bient
help("mean")

#***************************************************************************

## Manipulation des différents types d’objet de base de R 


# entier
x=2L # quand on met 2 par défaut c'est un nombre réel

typeof(x) # voir le type d'objet
is.integer(x) #vérifie si c'est un entier

x #afficher la valeur sur le console

print(x) #une autre manière d'afficher x


# nombre réél
y=2.4
typeof(y)
is.double(y)
is.integer(y)

# nombre complexe
z=2i+3
typeof(z)
is.complex(z) # est ce que z est un nombre complexe?
is.integer(z) # est ce que z est un entier?
Im(z) # la partie imaginaire
Re(z) # la partie réelle

#chaine de charactere
c="Senegal"
typeof(c)
is.character(c)

#Booléen
l=TRUE
l2=FALSE
typeof(l)
is.logical(l2)



### Structure des données

#un vecteur d'netier
x=c(16L, 26L, 30L,20L)
length(x) # la longueur du vecteur
typeof(x) # le type d'objet stockées dans le vecteur

# vecteur de nombres réels
y=c(16,26,30)
length(y)
typeof(y)

# vecteur de nombre complexes
z=c(2i,3i-1,5i+10,6i)
typeof(z)
length(z)
Im(z) # stocke les parties imaginaire
Re(z) # stocke les parties réelles



#vecteur de chaeacteres
c=c("Amsa","Rassoul","Ndeye Awa", "Aboubacar")
length(c)
typeof(c)

# vecteur de boolléens
l=c(TRUE,FALSE,T,T,F,F)
length(l)
typeof(l)

# création d'un matrice à partir de x
matrice=matrix(x,nrow=2,ncol=2)
print(matrice)



# un exemple de liste
liste=list(c(20L,12L),
           c(1,3,3),
           c(2i+1),
           c("MAman","Papa"),
           c(TRUE,FALSE)
)


print(liste)


# une lliste créée à partir de vecteur déjà définis
l2=list(x,y,z,c,l,matrice)

print(l2)

typeof(liste)
is.vector(l2)
is.list(l2)


sapply(l2,typeof) # une manière d'afficher de type de chaque élément
sapply(l2,class) # une manière d'afficher la class de chaque élément


# un exemple de dataframe
df=data.frame(
  Nom=c("Astou","Cheikh","Tidiane"),
  Age=c(20,22,25),
  Sexe=c("F","H","H"),
  Pays=c("Senegal","Burkina Faso","Senegal")
)


head(df)

typeof(df)
class(df)
is.data.frame(df)


#### quelqes Operations de base

x=20;y=10
x1=c(1,3,4);y1=c(0.2,3,2)

z1=c(1i,2i-1,3i);z2=c(-2i,6i+2,-8i)

#Addition
x+y
x1+y1 # addition élément par élément
z1+z2

# multiplication
x*y
x1*y1 # multiplication élément par élément
z1*z2  #multiplication élément par élément

#division
x/y

x1/y1 # division élément par élément
z1/z2 # division élément par élément


#division modulo: reste de la division de x par y
x%%y
x1%%y1
x1%%y1 # Division modulo élémént par élémént

#exposant
x^2
x1^2 # élève chaque élément au carré
z1^2

cos(x)
cos(x1) # calcul le cosinus de chaque élémént

# comparaison: ça renvoit un logical
x==y #verifier un e égalisé
x!=y # vérifier si c'est différent
x>=y
x<=y

TRUE==FALSE

"amsa"=="AMSA"

nom="Niang"
prenom="Amsata"

# combiner des objet de chaines de charactère en un seul objet
nom_complet=paste(prenom,nom,sep=";")
nom_complet
# remplacer "g" par G
gsub("N","M",nom)

#extraire la partie de la chaine de la position 2 à la position 4
substr(prenom,2,4)

group=c("Cheikh", "Amina","Fallou")

# extraire les indices de position des élément ayant un "m"
grep("m",group)
grep("m",group,value = T)

# extraire les éléménts des élément ayant un "m"
grep("a",group,value = T)





m=matrix(
  c(1,3,4,
    3,4,9,
    9,0,6),
  nrow = 3,
  ncol = 3
  
)

m^2 #eleve chaque element au carré

# A noter: commande rep()  replicate
m1=matrix(rep(c(1,2,3),times=3),nrow = 3,ncol = 3)
m2=matrix(rep(c(1,2,3),each=3),nrow = 3,ncol = 3)

#diagonal de A
diag(m)

#transposé
t(m)

#multiplication matricielle
m%*%m

# deter le vecteur/matrice X tell que mx=b
b=c(1,1,1)
x=solve(m,b)
print(x)

m%*%x


## Subsetting (filtre,extraction)

#un vecteur [

x=round(runif(10)*100)

x[1] # extraire le premier élément
x[2] #extraire le deuxième élément

x[-2] #  tous les elements sauf le deuxième

x[1:3] # les éléménts de 1 à 3

x[c(1,4,9)] #selectionner les elements 1 , 4 et 9

x[-c(1,4,9)] #selectionner les elements 1 , 4 et 9

x[x>10] # selectionner les elements superieur à 10

x[which(x>10)] # une autre manière de faire

# note: LETTERS
names(x)=LETTERS[1:10]
x
x["A"]
x[c("B","C")]

# note: rep
ind=rep(c(T,F),5)

x[ind]



##List
# extraire les 3 premiere lement dela liste sous forme d'une liste
l2[1:3]
l2[1]

l2[[3]] # extraire l'element dela list sous sa forme initiale

l2[[3]][1]
names(l2)=LETTERS[1:length(l2)]

l2$B # la même chose que l2[[1]]

#matrice
m

#matrice[ligne,colonne]

m[1,]
m[,1]

m[1:2,]
m[,c(TRUE,TRUE,FALSE)]

colnames(m)=c("col1","col2","col3")

m

m[,"col1"]
m[,c("col1","col3")]

#dataframe
df

df$Nom # la colonne Nom

df$Age # la comlonne age

df[,c("Nom","Age")] # extraire les colonnes Nom et Age sous forme de dataframe

df[1:2,]

df[df$Age==20,] # extraire les lignes où l'âge de la personne est 20

df[df$Age>20,] # extraire les lignes où l'âge de la personne est > 20

subset(df,Age>20) # une autre manière de faire



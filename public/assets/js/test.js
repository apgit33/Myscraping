// *********** Début Form ***********
//on récupère le formulaire
const f_signup = document.getElementById('form_signup');

//on récupère les div d'erreurs
const f_erreur = document.getElementsByClassName('verif');

//on ajoute un écouteur d'évènement sur la soumision du formulaire
f_signup.addEventListener('submit', e => {
    // on empêche l'envoie naturel du formulaire
    e.preventDefault();

    //on vide le champ des erreurs
    for (let erreur of f_erreur) {
        erreur.innerHTML ="";
    }

    //on récupère les données du formulaire sous forme de data (clé=>valeur)
    const formData = new FormData(f_signup);

    //on envoie les données du formulaire en ajax
    fetch('signup', {
        body: formData,
        method: "POST"
    })
    .then(response => response.json())
    .then(datas => {
        if (datas.validation === true) {
            location.href = ""
        }
        for( var index in datas.erreurs) {
            document.getElementById(index).innerHTML = datas.erreurs[index];
        }
        // datas.erreurs.forEach((data) => {
        //     // console.log(data.name[0]); 
        //     if(data.check_firstname) {
        //         let champ = document.createElement("p");
        //         champ.innerHTML = data.check_firstname;
        //         document.getElementById("check_firstname").appendChild(champ);
        //     }
        // });
    });
});
// *********** Fin Form ***********


// *********** Début Form -> catégorie ***********
//on récupère le select
const selectForm = document.querySelector('select[name="categorie"]');
//on récupère le champ prévu pour la nouvelle catégorie
const newCat = document.getElementById('new_cat');

//on écoute le changement du select, si la valeur est -1 on ajoute la nouvelle catégorie sinon on la retire
selectForm.addEventListener('change',function(){
    if (this.value != -1) {
        newCat.innerHTML=""
    }else {
        newCat.innerHTML ="<label class=\"label\">Nouvelle catégorie :</label><div class=\"control\"><input class=\"input is-medium\" type=\"text\" name=\"new_categorie\"></div>";
    }
})
// *********** Fin Form -> catégorie ***********



import { form } from "./functions.js"

form('form_extract', 'register', 'user/account')

// *********** Début Form -> catégorie ***********
//on récupère le select
const selectForm = document.querySelector('select[name="category"]');
//on récupère le champ prévu pour la nouvelle catégorie
const newCat = document.getElementById('new_cat');

//on écoute le changement du select, si la valeur est -1 on ajoute la nouvelle catégorie sinon on la retire
selectForm.addEventListener('change', function () {
    newCat.innerHTML = ""
    if (this.value == -1) {
        newCat.innerHTML = "<div class=\"column\"><div class=\"field\"><p class=\"control\"><input class=\"input\" type=\"text\" placeholder=\"New_cat\" name=\"new_categorie\"></p></div></div>"
    }
})
// *********** Fin Form -> catégorie ***********

// *********** Début Form -> type ***********
//on récupère le select
const selectForm2 = document.querySelector('select[name="type"]');
//on récupère le champ prévu pour la nouvelle catégorie
const newTyp = document.getElementById('new_typ');

//on écoute le changement du select, si la valeur est -1 on ajoute la nouvelle catégorie sinon on la retire
selectForm2.addEventListener('change', function () {
    newTyp.innerHTML = ""
    if (this.value == -1) {
        newTyp.innerHTML = "<div class=\"column\"><div class=\"field\"><p class=\"control is-expanded\"><input class=\"input\" type=\"text\" placeholder=\"new_typ\" name=\"new_type\"></p></div></div>"
    }
})
// *********** Fin Form -> catégorie ***********

const switchForm = document.querySelector('input[name="dataset"]');
//on récupère le champ prévu pour la nouvelle catégorie
const dataset = document.getElementById('dataset');

switchForm.addEventListener('change', function () {
    dataset.innerHTML = ""
    if (this.checked) {
        dataset.innerHTML = "<div class=\"column\"><div class=\"field\"><p class=\"control is-expanded\"><input class=\"input\" type=\"text\" placeholder=\"contenair\" name=\"contenair\"></p></div></div>"
    }
})

const dataButton = document.getElementById('new_data');

dataButton.addEventListener('click',  e => {
    e.preventDefault();
    console.log("test");
})
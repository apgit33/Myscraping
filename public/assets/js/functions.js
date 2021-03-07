export function form(id, destForm, destWin) {
    //on récupère le formulaire
    const form_custom = document.getElementById(id);

    //on récupère les div d'erreurs
    const f_erreur = document.getElementsByClassName('verif');

    //on ajoute un écouteur d'évènement sur la soumision du formulaire
    form_custom.addEventListener('submit', e => {
        // on empêche l'envoie naturel du formulaire
        e.preventDefault();

        //on vide le champ des erreurs
        for (let erreur of f_erreur) {
            erreur.innerHTML = "";
        }

        //on récupère les données du formulaire sous forme de data (clé=>valeur)
        const formData = new FormData(form_custom);

        //on envoie les données du formulaire en ajax
        fetch(destForm, {
            body: formData,
            method: "POST"
        })
            .then(response => response.json())
            .then(datas => {
                if (datas.validation === true) {
                    location.href = destWin
                }
                for (var index in datas.erreurs) {
                    document.getElementById(index).innerHTML = datas.erreurs[index];
                }
            });
    });
}
export function form(id, dest) {
    //on récupère le formulaire
    const f_signup = document.getElementById(id);

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
        fetch(dest, {
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
        });
    });
}
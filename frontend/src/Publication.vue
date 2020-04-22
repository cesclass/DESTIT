<template>
  <article class="publication">

    <!-- Coté gauche de la publication (photo) -->
    <div class="bord_gauche">
      <h3>DESTIT publication</h3>
      <img class="image"
        src="./assets/placeholder_img.png" 
        :alt="titre">
    </div>

    <!-- Coté droit de la publication -->
    <div class="presentation">

      <!-- Titre de la publication -->
      <a href="#" class="titre"> <h2> {{ titre }} </h2> </a>

      <!-- Liste des auteurs de la publication -->
      <div class="auteurs">
        <a href="#" class="auteur" v-for="auteur in auteurs">
          <img class="miniature"
            src="./assets/placeholder_profil.jpg"
            :alt="auteur">
          <h3> {{ auteur }} </h3>
          <h3 v-if="auteur !== auteurs[auteurs.length - 1]">, </h3> 
        </a>
      </div>

      <!-- Source de la publication -->
      <div class="ouvrage">
        <a href="#" class="nom_ouvrage"> <h3> {{ ouvrage }},&thinsp; </h3> </a>
        <h3 class="date"> {{ date }} </h3>
      </div>
    </div>

    <!-- Aperçu du résumé de la publication -->
    <p class="apercu"> {{ apercu }} </p>

    <!-- Liens externes -->

  </article>
</template>

<script>
export default {
  data () {
    return {
      titre: "Ma nouvelle publication",
      auteurs: ["Dylan Caron", "Cyril Esclassan", "Florian Azizen", "Nicolas Augier"],
      type: "conference",
      ouvrage: "The best conference ever",
      date: "29/47/53",
      resume: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer maximus eros sed leo consequat molestie. Aenean nec tellus mollis, viverra sapien quis, feugiat mi. Nulla ipsum purus, pharetra eget fermentum ut, imperdiet vitae leo. Phasellus ut gravida mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vel erat sollicitudin, sollicitudin sapien at, faucibus odio. Suspendisse potenti. Integer posuere nisi eget viverra euismod. Aliquam neque odio, faucibus sit amet mollis vel, lacinia quis nisi. Proin iaculis sodales est a tristique. Integer a nisi non purus lobortis mattis at sed lectus. Nullam magna neque, aliquam sed fermentum ut, aliquet vel enim. Maecenas lacinia ante in vulputate porttitor. Maecenas et ultrices dui, vel consequat ligula. Nam ac suscipit lacus. Pellentesque efficitur molestie velit, quis mollis nibh varius eu."
    }
  }, 

  computed: {
    /*  N'affiche que le 100 premiers caractères du résumés
        dans l'apercu.
    */
    apercu () {
      const $splited = this.resume.split(' ')
      let $res = []

      if ($splited.length < 100) {
        for (let $i = 0; $i < 100; $i++) {
            $res.push($splited[$i])
        }

        return $res.join(' ') + '...'
      }

      return $splited.join(' ')
    }
  }
}
</script>

<style src="../css/publication.css">
</style>
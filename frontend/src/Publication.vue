<template>
  <article class="publication">
    <img class="image"
      src="./assets/placeholder.png" 
      :alt="titre">
    <div class="presentation">
      <a href="#" class="titre"> <h2> {{ titre }} </h2> </a>
      <a href="#" class="auteur"> <h3> {{ auteur }} </h3> </a>
      <a href="#" class="ouvrage"> <h3> {{ ouvrage }} </h3> </a>
      <h3 class="date"> {{ date }} </h3>
    </div>
    <div class="apercu"> {{ apercu }} </div>
  </article>
</template>

<script>
export default {
  data () {
    return {
      titre: "Ma nouvelle publication",
      auteur: "Dylan Caron",
      ouvrage: "The conference",
      date: "20/07/1996",
      resume: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer maximus eros sed leo consequat molestie. Aenean nec tellus mollis, viverra sapien quis, feugiat mi. Nulla ipsum purus, pharetra eget fermentum ut, imperdiet vitae leo. Phasellus ut gravida mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vel erat sollicitudin, sollicitudin sapien at, faucibus odio. Suspendisse potenti. Integer posuere nisi eget viverra euismod. Aliquam neque odio, faucibus sit amet mollis vel, lacinia quis nisi. Proin iaculis sodales est a tristique. Integer a nisi non purus lobortis mattis at sed lectus. Nullam magna neque, aliquam sed fermentum ut, aliquet vel enim. Maecenas lacinia ante in vulputate porttitor. Maecenas et ultrices dui, vel consequat ligula. Nam ac suscipit lacus. Pellentesque efficitur molestie velit, quis mollis nibh varius eu."
    }
  }, 

  computed: {
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
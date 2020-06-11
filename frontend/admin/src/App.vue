<template>
  <div class="formulaire">
    <header>
      <h1 class="main_title">DESTIT</h1>
    </header>

    <div class="main_form">
      <formulaire v-for="category in categories" :key="category.name"
          :cat="category">
      </formulaire>
    </div>

    <footer>
      <input type="submit" value="Valider" class="submit">
      <input type="reset" value="Annuler" class="reset">
    </footer>
  </div>
</template>

<script>
import formulaire from "./Form.vue"

export default {
  components: {
    formulaire
  }, 

  name: 'app',

  data () {
    return {
      categories: [
        {
          name: "system",
          values: ["computer", "smartphone", "mobile phone", "smartwatch"],
          is_open: false,
          exclusive: false
        },
        {
          name: "input device",
          values: ["mouse", "trackball", "eyetracker"],
          is_open: false,
          exclusive: true
        },
        {
          name: "disability",
          values: ["motor", "visualy impaired"],
          is_open: false,
          exclusive: false
        },
        {
          name: "method",
          values: ["key based", "gesture based"],
          is_open: false,
          exclusive: false
        },
        {
          name: "navigation",
          values: ["direct", "switch scanning", "indirect pointer"],
          is_open: false,
          exclusive: false
        },
        {
          name: "selection",
          values: ["discrete", "continuous"],
          is_open: false,
          exclusive: false
        },
        {
          name: "prediction system",
          values: [],
          is_open: false,
          exclusive: false
        },
        {
          name: "transformation",
          values: [],
          is_open: false,
          exclusive: false
        },
        {
          name: "output",
          values: [],
          is_open: false,
          exclusive: false
        },
        {
          name: "widget",
          values: [],
          is_open: false,
          exclusive: false
        }
      ]
    };
  }
}
</script>

<style src="../css/app.css">
</style>
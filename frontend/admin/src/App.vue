<template>
  <div class="formulaire">
    <header>
      <h1 class="main_title">DESTIT</h1>
    </header>

    <authorForm
      :title='"Add a researcher"'
      :description='"Please, complete the identity of the new author"'
      :data='author'>
    </authorForm>

  </div>
</template>

<script>
import authorForm from "./AuthorForm.vue"

export default {
  components: {
    authorForm
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
      ],

      author: {
        identity: {
          firstname: "",
          lastname: ""
        }, 
        mail: "",
        photo: "",
        url: ""
      }
    };
  }
}
</script>

<style>
  body {
    background-color: black;
  }
</style>
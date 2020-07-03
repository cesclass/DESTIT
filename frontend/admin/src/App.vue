<template>
<!-- ANCHOR - TEMPLATE -->
  <div class="main">
    <header>
      <h1 class="main_title">DESTIT</h1>
    </header>

    <!-- admin panel -->
    <div class="admin_panel">
      
      <adminPanel></adminPanel>

    </div>

    <!-- author form -->
    <div class="author_form"
      hidden>

      <addForm
        :type="'author'">
      </addForm>

    </div>

  </div>
</template>

<script>
// ANCHOR - SCRIPT
import adminPanel from "./AdminPanel.vue"
import addForm from "./AddForm.vue"

export default {
  components: {
    adminPanel,
    addForm
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
/* ANCHOR - STYLE */
  body {
    color: white;

    background-color: black;
    font-family: Arial, Helvetica, sans-serif;
  }
</style>
<template>
<!-- ANCHOR - TEMPLATE -->
  <div class="main">
    <header>
      <h1 class="main_title not_selectable">
        DESTIT
      </h1>
    </header>

    <!-- admin panel -->
    <div class="admin_panel active"
      hidden>
      
      <adminPanel
        @publication_button_clicked="display_publication_form"
        @researcher_button_clicked="display_researcher_form">
      </adminPanel>

    </div>

    <!-- researcher form -->
    <div class="researcher_form"
      hidden>

      <addForm
        :type="'researcher'"
        @close_form="close_researcher_form">
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

      researcher: {
        identity: {
          firstname: "",
          lastname: ""
        }, 
        mail: "",
        photo: "",
        url: ""
      }
    };
  },

  methods: {
    display_publication_form: function () {

    },

    display_researcher_form: function () {
      for (const elt of document.querySelectorAll(".admin_panel, .researcher_form")) {
        elt.classList.toggle("active");
      }

      document.querySelector(".researcherForm-input").focus();
    },

    close_researcher_form: function () {
      for (const elt of document.querySelectorAll(".admin_panel, .researcher_form")) {
        elt.classList.toggle("active");
      }
    }
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

  .active {
    display: block;
  }

  .not_selectable {
    user-select: none;
    -moz-user-select: none;     /* Moz://a    */
    -webkit-user-select: none;  /* webkit     */
    -ms-user-select: none;      /* microsoft  */
  }
</style>
<template>
<!-- ANCHOR - TEMPLATE -->
  <div class="addForm-main">

    <div class="addForm-top">

      <div class="addForm-header">

        <img class="addForm-icon not_selectable"
          src="./assets/return.svg" 
          alt="return"
          @click="previous">
        
        <img class="addForm-icon not_selectable"
          src="./assets/close.svg" 
          alt="close"
          @click="close_form">

      </div>

      <div class="addForm-text_area">

        <!-- title -->
        <h1 class="addForm-title" 
          v-if="type === 'researcher'"> 
          Add a researcher 
        </h1>

        <!-- description -->
        <p class="addForm-description"
          v-if="type === 'researcher'"> 
          Please, fill in the informations about the new researcher 
        </p>

      </div>

      <!-- stepDisplay -->
      <stepDisplay 
        :nb_steps=4
        :step=step
        v-on:update_step_event="update_step">
      </stepDisplay>
      
    </div>

    <div class="addForm-bottom_area">

      <h2> Step {{ step }} </h2>

      <!-- form -->
      <researcherForm ref="researcher_form"
        v-if="type ==='researcher'"
        :step=step>
      </researcherForm>

      <!-- button -->
      <button class="addForm-button not_selectable"
        v-on:click="submit">
        Submit
      </button>

    </div>
    
  </div>
</template>

<script>
// ANCHOR - SCRIPT
import stepDisplay from "./StepDisplay.vue"
import researcherForm from "./ResearcherForm.vue"

export default {
  props: ['type'],

  components: {
    stepDisplay,
    researcherForm
  },

  computed: {
    // Compute nb steps depending on form type
    nb_steps: function () {
      if (this.type === "researcher") return 4;

      return -1;
    }
  },

  data () {
    return {
      step: 1,
    }
  },

  methods: {
    close_form: function () {
      this.step = 1;
      this.$refs.researcher_form.reset();

      this.$emit("close_form");
    },

    update_focus: function () {
      // 'this' cannot be used in 'setTimeout'
      // so I save researcher_form before
      const researcher_form = this.$refs.researcher_form;

      // Time out is used to wait the input beeing displayed
      setTimeout(function () {
        researcher_form.update_focus();
      }, 10);
    },

    // update the current step number
    update_step: function (n) {
      this.step = n;
      this.update_focus();
    },

    submit: function () {
      this.step ++
      this.update_focus();
    }, 

    previous: function () {
      this.step --;
      this.update_focus();
    }
  }
}
</script>

<style>
/* ANCHOR - STYLE */
  /* main */
  .addForm-main {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  
    width: 40rem;

    margin: auto;
    padding: 1rem;
    color: white;

    font-size: 13px;
    font-family: Arial, Helvetica, sans-serif;

    box-shadow: 0 2px 2px 2px rgba(255, 255, 255, 0.2);
  }

  /* header */
  .addForm-header {
    display: flex;
    flex-direction: row;
    justify-content: space-between;

    margin-bottom: 1.5rem;
  }

  /* icon */
  .addForm-icon {
    width: 2rem;
    opacity: 0.9;
  }

  .addForm-icon:hover {
    cursor: pointer;
  }

  /* bottom_area */
  .addForm-bottom_area {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

  /* button_area */
  .addForm-buttons_area {
    margin-top: 1rem;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    justify-content: center;
  }

  /* button */
  .addForm-button {
    color: white;
    font-weight: bold;

    width: 5rem;
    height: 3rem;

    margin-top: 1rem;
    border: none;

    background-color: rgb(12, 194, 158);
  }

  .addForm-button:hover, 
  .addForm-button:focus {
    outline: none;

    border: 2px solid white;
    cursor:pointer;
  }
</style>
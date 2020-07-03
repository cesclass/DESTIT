<template>
<!-- ANCHOR - TEMPLATE -->
  <div class="addForm-main">

    <div class="addForm-top">

      <div class="addForm-text_area">

        <!-- title -->
        <h1 class="addForm-title" 
          v-if="type === 'author'"> 
          Add a researcher 
        </h1>

        <!-- description -->
        <p class="addForm-description"
          v-if="type === 'author'"> 
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
      <authorForm 
        v-if="type ==='author'"
        :step=step>
      </authorForm>

      <!-- buttons -->
      <div class="addForm-buttons_area" 
        hidden>

        <button class="addForm-button"
          v-on:click="step--">
          Previous
        </button>

        <button class="addForm-button"
          v-on:click="step++">
          Next
        </button>

      </div>

    </div>
    
  </div>
</template>

<script>
// ANCHOR - SCRIPT
import stepDisplay from "./StepDisplay.vue"
import authorForm from "./AuthorForm.vue"

export default {
  props: ['type'],

  components: {
    stepDisplay,
    authorForm
  },

  computed: {
    // Compute nb steps depending on form type
    nb_steps: function () {
      if (this.type === "author") return 4;

      return -1;
    }
  },

  data () {
    return {
      step: 1,
    }
  },

  methods: {
    // update the current step number
    update_step: function (n) {
      this.step = n;
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

    width: 5rem;
    height: 3rem;

    margin: 0 1rem;
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
<template>
<!-- ANCHOR - TEMPLATE -->
  <div class="authorForm-main">

    <div class="authorForm-form">

      <input class="authorForm-input"
        type="text" 
        name="firstname" 
        placeholder="firstname" 
        :class="{active: step === 1}"
        v-model="researcher.firstname" 
        required
        hidden>

      <input class="authorForm-input"
        type="text" 
        name="lastname" 
        placeholder="lastname"
        :class="{active: step === 1}"
        v-model="researcher.lastname" 
        required
        hidden>

    </div>

    <div class="authorForm-form">

      <input class="authorForm-input"
        type="email" 
        name="mail" 
        placeholder="mail"      
        :class="{active: step === 2}"
        v-model="researcher.mail"
        required
        hidden>

    </div>
    
    <div class="authorForm-form flex_row">

      <label class="authorForm-label"
        for="photo" 
        :class="{active: step === 3}" 
        hidden>

        <button class="authorForm-button"
          type="button" 
          v-on:click.passive="open_file">
          choose file
        </button> 

      </label>

      <div class="authorForm-photo_description" 
        :class="{active: step === 3}" 
        hidden> 
        {{ profile_picture }} 
      </div>

      <input class="authorForm-photo_input"
        type="file" 
        id="photo"
        :class="{active: step === 3}"
        v-on:change="update_photo">

    </div>

    <div class="authorForm-form">

      <input class="authorForm-input"
        :class="{active: step === 4}"
        type="url"
        placeholder="website"
        hidden>

    </div>
    
  </div>
</template>

<script>
// ANCHOR - SCRIPT
export default {
  props: ["step"],

  computed: {
    // profile picture name or default message if missing
    profile_picture: function () {
      return this.researcher.photo === "" ? "Profile picture" : this.researcher.photo;
    }
  },

  data () {
    return {
      researcher: {
        firstname: "",
        lastname: "",
        mail: "",
        photo: "",
        url: ""
      }
    }
  },

  methods: {
    // Update researcher.photo whith choosen picture name
    update_photo: function (e) {
      let filename = e.target.value;
      if (!filename.length) return;

      let path = filename.split(/\/|\\/);
      this.researcher.photo = path[path.length - 1];
    },

    // Trigger file selector when "choose file" button clicked
    open_file: function () {
      document.querySelector('.authorForm-photo_input').click();
    }
  }
}
</script>

<style>
/* ANCHOR - STYLE */
  .authorForm-main {
    color: white;

    font-family: Arial, Helvetica, sans-serif;
    font-size: 13px;
  }

  /* form */
  .authorForm-form {
    display: flex;
    flex-direction: column;
  }

  /* input */
  .authorForm-input {
    color: white;
    height: 1.5rem;
    margin-bottom: 1rem;
    background-color: rgba(12, 194, 158, 0.25);
    border: 1px solid darkgrey;
    padding: 0 0.5rem;
  }

  .authorForm-input:focus {
    border-color:white;
    outline: none;
  }

  /* photo_input */
  .authorForm-photo_input {
    display: none;
  }

  /* photo_description */
  .authorForm-photo_description {
    height: 1.5rem;
    line-height: 1.5rem;

    margin: 0 0.5rem;
  }

  /* label */
  .authorForm-label {
    color: white;
    margin-bottom: calc(1rem + 2px);
  }

  /* button */
  .authorForm-button {
    color: white;

    margin: 0;
    border: none;

    background-color: rgb(12, 194, 158);

    height: 1.5rem;
    width: 8rem;
  }

  .authorForm-button:hover, 
  .authorForm-button:focus {
    outline: none;

    border: 2px solid white;
    cursor:pointer;
  }

  /* active behaviour */
  .authorForm-input.active, 
  .authorForm-label.active, 
  .authorForm-photo_description.active {
    display: block;
  }

  /* display flex-row */
  .flex_row {
    display: flex;
    flex-direction: row;
  }

  /* placeholder */
  ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
    color: darkgrey;
    opacity: 1;
  }

  :-ms-input-placeholder { /* Internet Explorer 10-11 */
    color: darkgrey;
  }

  ::-ms-input-placeholder { /* Microsoft Edge */
    color: darkgrey;
  }
</style>
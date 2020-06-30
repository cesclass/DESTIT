<template>
  <div class="main">
    <div class="top">
      <div class="text">
        <h1> {{ title }} </h1>
        <p> {{ description }} </p>
      </div>

      <div class="steps">
        <div class="link" v-for="n in nb_steps-1" 
          :key="n">
    
          <div class="step_num"
            :class="{done: n < step, active: n === step}"
            v-on:click="step = n">
            <span :class="{done: n < step}">{{ n }}</span>
            <img src="./assets/check.png" alt="done"
              :class="{done: n < step}"
              hidden>
          </div>

          <div class="separator"
            :class="{done: n < step}"></div>
          <div class="empty"
            :class="{done: n < step}"></div>
        </div>

        <div class="step_num"
          :class="{done: step > nb_steps, active: step === nb_steps}"
          v-on:click="step = nb_steps">
          {{ nb_steps }}
        </div>
      </div>
    </div>

    <div class="bot">
      <h2>Step {{ step }}</h2>
      <div>
        <div class="all_forms">
          <div class="form">
            <input :class="{active: step === 1}" class="input" type="text" name="firstname" placeholder="firstname" required hidden>
            <input :class="{active: step === 1}" class="input" type="text" name="lastname" placeholder="lastname" required hidden>
          </div>

          <div class="form">
            <input :class="{active: step === 2}" class="input" type="email" name="mail" placeholder="mail" required hidden>
          </div>

          <div class="form flex-row">
            <label for="photo" :class="{active: step === 3}" hidden>
              <button type="reset" class="file-button">choose file</button> 
            </label>
            <div class="photo-description" :class="{active: step === 3}" hidden>Profile picture</div>
            <input :class="{active: step === 3}" class="input-photo" id="photo" type="file" placeholder="photo" hidden>
          </div>

          <div class="form">
            <input :class="{active: step === 4}" class="input" type="url" placeholder="website" hidden>
          </div>
        </div>

        <div class="buttons" hidden>
          <button class="prev"
            v-on:click="step--">Previous</button>
          <button class="next"
            v-on:click="step++">Next</button>
        </div>
      </div>
    </div>

    
  </div>
</template>

<script>
export default {
  props: ['title', 'description', 'data'],

  computed: {
    nb_steps: function() {
      return Object.keys(this.data).length;
    }
  },

  data () {
    return {
      step: 1
    }
  }
}
</script>

<style>
  .main {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  
    width: 40rem;
    height: 27rem;

    margin: auto;
    padding: 1rem;
    color: white;

    font-size: 13px;
    font-family: Arial, Helvetica, sans-serif;

    border-top: 1px solid white;
    border-bottom: 1px solid white;
  }

  .steps {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    justify-content: center;
    align-items: center;

    height: 5rem;
    padding-bottom: 2rem;

    border-bottom: 1px solid grey;
  }

  .link {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    align-items: center;
  }

  .step_num {
    width: 3rem;
    height: 3rem;

    display: flex;
    justify-content: center;
    align-items: center;

    border: 0.3rem solid white;
    border-radius: 3rem;
  }

  .separator {
    width: 0rem;
    height: 0.4rem;

    background-color: white;
  }

  .empty {
    width: 4rem;
    height: 0rem;

    background-color: black;
  }

  .step_num.active {
    color: rgb(12, 194, 158);
    font-weight: bolder;
    border-color: rgb(12, 194, 158);
  }

  .separator.done {
    animation-duration: 0.25s;
    animation-name: grow;

    width: 4rem;
  }

  .empty.done {
    animation-duration: 0.25s;
    animation-name: shrink;

    width: 0;
  }

  img.done {
    width: 50%;
    display: block;
  }

  span.done {
    display: none;
  }

  .bot {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

  input.active, label.active, .photo-description.active {
    display: block;
  }

  label {
    color: white;
  }

  @keyframes grow {
    from {
      width: 0rem;
    }

    to {
      width: 4rem;
    }
  }

  @keyframes shrink {
    from {
      width: 4rem;
    }

    to {
      width: 0rem;
    }
  }

  .form {
    display: flex;
    flex-direction: column;
  }

  .buttons {
    margin-top: 1rem;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    justify-content: center;
  }

  .input {
    color: white;
    height: 1.5rem;
    margin-top: 1rem;
    background-color: rgba(12, 194, 158, 0.25);
    border: 1px solid darkgrey;
    padding: 0 0.5rem;
  }

  input.input-photo {
    display: none;
  }

  input:focus {
    border-color:white;
    outline: none;
  }

  button {
    color: white;

    width: 5rem;
    height: 3rem;

    margin: 1rem 1rem 0 1rem;
    border: none;

    background-color: rgb(12, 194, 158);
  }
  
  button.file-button {
    height: 1.5rem;
    width: 8rem;

    margin: 0;
  }

  .photo-description {
    height: 1.5rem;
    line-height: 1.5rem;

    margin: 0 0.5rem;
  }

  button:hover, button:focus, .button:hover, .button:focus {
    outline: none;

    border: 2px solid white;
    cursor:pointer;
  }

  .flex-row {
    display: flex;
    flex-direction: row;
  }

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
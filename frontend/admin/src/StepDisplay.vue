<template>
<!-- ANCHOR - TEMPLATE --> 
  <div class="stepDisplay-main">

    <!-- n-1 premieres étapes -->
    <div class="stepDisplay-link" 
      v-for="n in nb_steps-1" 
      :key="n">

      <div class="stepDisplay-step_num_circle"
        :class="{done: n < step, active: n === step}"
        v-on:click="update_step(n)">

        <span class="stepDisplay-step_digit not_selectable"
          :class="{done: n < step}">
          {{ n }}
        </span>

        <img class="stepDisplay-check_icon not_selectable" 
          src="./assets/check.svg" 
          alt="check_icon"
          :class="{done: n < step}"
          hidden>
      </div>

      <!-- séparateurs -->
      <div class="stepDisplay-separator"
        :class="{done: n < step}"></div>

      <div class="stepDisplay-empty_space"
        :class="{done: n < step}"></div>
    </div>

    <!-- n ième étape -->
    <div class="stepDisplay-step_num_circle"
      :class="{
        done: step > nb_steps, 
        active: step === nb_steps
      }"
      v-on:click="update_step(nb_steps)">

      <span class="stepDisplay-step_digit not_selectable" 
        :class="{done: nb_steps < step}"> 
        {{ nb_steps }} 
      </span>

      <img class="stepDisplay-check_icon not_selectable" 
        src="./assets/check.svg" 
        alt="done"
        :class="{done: nb_steps < step}"
        hidden>

    </div>

  </div>
</template>

<script>
// ANCHOR - SCRIPT
export default {
  props: ["nb_steps", "step"],

  data () {
    return {

    }
  },

  methods: {
    /* Warn parent about step change */
    update_step: function (n) {
      if (n < this.step) {
        this.$emit("update_step_event", n);
      }
    }
  }
}
</script>

<style>
/* ANCHOR - STYLE */
  .stepDisplay-main {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    justify-content: center;
    align-items: center;

    color: white;
    font-family: Arial, Helvetica, sans-serif;

    height: 5rem;
    padding-bottom: 1rem;

    border-bottom: 1px solid grey;
  }

  .stepDisplay-link {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;

    align-items: center;
  }

  /* step_num_circle */
  .stepDisplay-step_num_circle {
    width: 3rem;
    height: 3rem;

    font-size: 20px;

    display: flex;
    justify-content: center;
    align-items: center;

    border: 0.3rem solid white;
    border-radius: 3rem;
  }

  .stepDisplay-step_num_circle.active {
    color: rgb(12, 194, 158);
    font-weight: bolder;
    border-color: rgb(12, 194, 158);
  }

  .stepDisplay-step_num_circle.done {
    cursor: pointer;
  }

  /* step_digit */
  .stepDisplay-step_digit {
    font-size: 20px;
  }

  .stepDisplay-step_digit.done {
    display: none;
  }

  /* check_icon */
  .stepDisplay-check_icon.done {
    width: 50%;
    display: block;
  }

  /* separator */
  .stepDisplay-separator {
    width: 0rem;
    height: 0.4rem;

    background-color: white;
  }

  .stepDisplay-separator.done {
    animation-duration: 0.25s;
    animation-name: stepDisplay-grow;

    width: 4rem;
  }

  /* empty_space */
  .stepDisplay-empty_space {
    width: 4rem;
    height: 0rem;

    background-color: black;
  }

  .stepDisplay-empty_space.done {
    animation-duration: 0.25s;
    animation-name: stepDisplay-shrink;

    width: 0;
  }

  /* -- Animations -- */
  @keyframes stepDisplay-grow {
    from {
      width: 0rem;
    }

    to {
      width: 4rem;
    }
  }

  @keyframes stepDisplay-shrink {
    from {
      width: 4rem;
    }

    to {
      width: 0rem;
    }
  }
</style>
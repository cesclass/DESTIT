<template>
<!-- ANCHOR - TEMPLATE -->
  <div class="adminPanel-main">

      <button class="adminPanel-add_button"
        @click="researcher_button_clicked">

        <img class="adminPanel-svg"
          src="./assets/researcher.svg" 
          alt="add researcher">

        <h2 class="adminPanel-add_title"> Add a new researcher </h2>

      </button>

      <button class="adminPanel-add_button"
        @click="publication_button_clicked">

        <img class="adminPanel-svg"
          src="./assets/publication.svg" 
          alt="add publication">

        <h2 class="adminPanel-add_title"> Add a new publication </h2>

      </button>

  </div>
</template>

<script>
// ANCHOR - SCRIPT
export default {
  methods: {
    researcher_button_clicked: function () {
      this.$emit("researcher_button_clicked");
    },

    publication_button_clicked: function () {
      this.$emit("publication_button_clicked");
    }
  }
}
</script>

<style>
/* ANCHOR - STYLE */
  .adminPanel-main {
    margin: auto;
    margin-top: 10rem;
    width: 40rem;

    display: flex;
    flex-direction: row;
    justify-content: space-between;

  }

  .adminPanel-add_button {
    width: 18rem;
    height: 18rem;

    text-align: center;

    background-color: black;
    color: white;

    border-radius: 3rem;
    border: none;
    box-shadow: 0 2px 2px 2px rgba(255, 255, 255, 0.2);
  }

  .adminPanel-add_button:hover, 
  .adminPanel-add_button:focus {
    outline: none;

    border-radius: 3rem;
    box-shadow: 0 2px 2px 2px rgb(255, 255, 255);

    cursor:pointer;
  }

  .adminPanel-svg {
    height: 12rem;
    margin: 1rem;
  }

  .adminPanel-add_title {
    margin: 0;
  }

</style>
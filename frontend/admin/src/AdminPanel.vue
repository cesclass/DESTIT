<template>
<!-- ANCHOR - TEMPLATE -->
  <div class="adminPanel-main">

      <button class="adminPanel-add_button">

        <img class="adminPanel-svg"
          src="./assets/researcher.svg" 
          alt="add researcher">

        <h2 class="adminPanel-add_title"> Add a new researcher </h2>

      </button>

  </div>
</template>

<script>
// ANCHOR - SCRIPT
export default {

}
</script>

<style>
/* ANCHOR - STYLE */
.adminPanel-add_button {
  width: 20rem;
  height: 20rem;

  text-align: center;

  background-color: black;

  border-radius: 3rem;
  box-shadow: 0 2px 2px 2px rgba(255, 255, 255, 0.2);
}

.adminPanel-svg {
  width: 16rem;
  height: 16rem;
}

.adminPanel-add_title {
  margin: 0;
}

</style>